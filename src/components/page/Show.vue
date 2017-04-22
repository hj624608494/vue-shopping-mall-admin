<template>
    <div class="table">
        <div class="crumbs">
            <el-row>
                <el-col :span="24">
                    <el-breadcrumb separator="/">
                        <el-breadcrumb-item><i class="el-icon-menu"></i> 首页管理</el-breadcrumb-item>
                        <el-breadcrumb-item>商品展示</el-breadcrumb-item>
                    </el-breadcrumb>
                </el-col>
            </el-row>
        </div>

        <el-table :data="tableData" border style="width: 100%">
            <el-table-column prop="id" label="ID" sortable width="150"></el-table-column>
            <el-table-column prop="name" label="名称"></el-table-column>
            <el-table-column prop="price" label="商品价格" width="150"></el-table-column>
            <el-table-column label="状态" width="150">
                <template scope="scope">已上架</template>
            </el-table-column>
            <el-table-column prop="createtime" label="创建时间"></el-table-column>
           
            <el-table-column label="操作" width="180">
                <template scope="scope">
                    <el-button size="small" type="danger"
                        @click="del(scope.$index, scope.row)">下架</el-button>
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

    </div>
</template>

<script>
    import service from '../../assets/service.js'
    import qs from 'qs';

    export default {
        data() {
            return {
                tableData: [],
                cur_page: 1,
                count: 0,
                pageSize: 20
            }
        },
        created(){
            this.getData();
        },
        methods: {
            handleCurrentChange(val){
                this.cur_page = val;
                this.getData();
            },
            getData(){
                let self = this;
                
                this.$axios.post(service.url('getGoods'), qs.stringify({
                    num: self.pageSize,
                    currentPage: self.cur_page
                }),{headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                }).then((res) => {
                    if (res.data.code == 200) {
                        self.tableData = res.data.data;
                        self.count || (self.count = res.data.acount);
                    }
                })
            },
            del(index, row) {
                let self = this;

                this.$axios.post(service.url('modifyGoodsProduce'), qs.stringify({
                    id: row.id
                }),{
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                }).then((res) => {
                    if (res.data.code == 200) {
                        this.$message.error('下架成功');
                        self.tableData.splice(index, 1);
                    }
                })
            }
        }
    }
</script>