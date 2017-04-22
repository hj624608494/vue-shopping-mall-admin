<template>
    <div class="table">
        <div class="crumbs">
            <el-row>
                <el-col :span="21">
                    <el-breadcrumb separator="/">
                        <el-breadcrumb-item><i class="el-icon-menu"></i> 商品管理</el-breadcrumb-item>
                        <el-breadcrumb-item>商品管理</el-breadcrumb-item>
                    </el-breadcrumb>
                </el-col>

                <el-col :span="3">
                    <el-button type="primary" icon="plus" @click="handle">添加商品</el-button>
                </el-col>
            </el-row>
        </div>

        <el-table :data="tableData" border style="width: 100%">
            <el-table-column prop="id" label="ID" sortable width="150"></el-table-column>
            <el-table-column prop="name" label="名称"></el-table-column>
            <el-table-column label="图片" width="150">
                <template scope="scope">
                    <img @click="dialogImg(scope.row.images[0])" :src="scope.row.images[0]" width="100%">
                </template>
            </el-table-column>
            <el-table-column prop="price" label="价格" width="150"></el-table-column>
            <el-table-column prop="createtime" label="创建时间" width="150"></el-table-column>
           
            <el-table-column label="操作" width="180">
                <template scope="scope">
                    <el-button size="small" type="warning"
                        @click="handle(scope.row)">修改</el-button>
                    <el-button size="small" type="danger"
                        @click="del(scope.$index, scope.row)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>

        <div class="pagination">
            <el-pagination
                    @current-change ="handleCurrentChange"
                    layout="prev, pager, next"
                    :total="count"
                    :page-size="pageSize">
            </el-pagination>
        </div>

        <el-dialog v-model="dialogVisible" size="large">
            <img :src="dialogImgUrl" style="max-width: 100%;">
        </el-dialog>

    </div>
</template>

<script>
    import service from '../../assets/service.js'
    import qs from 'qs';
    import { Loading } from 'element-ui';

    export default {
        data() {
            return {
                tableData: [],
                cur_page: 1,
                count: 0,
                pageSize: 20,
                dialogImgUrl: '',
                dialogVisible: false
            }
        },
        created(){
            this.getData();
        },
        methods: {
            dialogImg(url){
                this.dialogImgUrl = url;
                this.dialogVisible = true;
            },
            handleCurrentChange(val){
                this.cur_page = val;
                this.getData();
            },
            // 跳转修改/添加页面
            handle(row){
                this.$router.push({ path: 'handleGoods', query: { id: row.id }})
            },
            getData(){
                let self = this;
                let loading = Loading.service({ fullscreen: true });
                
                this.$axios.post(service.url('getGoodsList'), qs.stringify({
                    num: self.pageSize,
                    currentPage: self.cur_page
                }),{headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                }).then((res) => {
                    if (res.data.code == 200) {
                        self.tableData = res.data.data;
                        self.count || (self.count = res.data.acount);
                        loading.close();
                    }
                })
            },
            del(index, row) {
                let self = this;

                this.$axios.post(service.url('delGoods'), qs.stringify({
                    id: row.id
                }),{
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                }).then((res) => {
                    if (res.data.code == 200) {
                        this.$message.error('删除成功');
                        self.tableData.splice(index, 1);
                    }
                })
            }
        }
    }
</script>