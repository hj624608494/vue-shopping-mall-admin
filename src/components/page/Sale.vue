<template>
    <div class="table">
        <div class="crumbs">
            <el-row>
                <el-col :span="21">
                    <el-breadcrumb separator="/">
                        <el-breadcrumb-item><i class="el-icon-menu"></i> 首页管理</el-breadcrumb-item>
                        <el-breadcrumb-item>特价展示</el-breadcrumb-item>
                    </el-breadcrumb>
                </el-col>

                <el-col :span="3">
                    <el-button type="primary" icon="plus" @click="addDialog">添加特价</el-button>
                </el-col>
            </el-row>
        </div>

        <el-table :data="tableData" border style="width: 100%">
            <el-table-column prop="good_id" label="ID" sortable width="150">
            </el-table-column>
            <el-table-column prop="name" label="名称">
            </el-table-column>
            <el-table-column prop="price" label="商品价格" width="150"></el-table-column>
           
            <el-table-column label="操作" width="180">
                <template scope="scope">
                    <el-button size="small" type="warning"
                        @click="edit(scope.$index, scope.row)">修改</el-button>
                    <el-button size="small" type="danger"
                        @click="del(scope.$index, scope.row)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>

        <el-dialog :title="dialogTitle" v-model="dialogVisible" size="tiny">
            <el-form ref="form" :model="form" label-width="80px">
                <el-form-item label="商品ID">
                    <el-input v-model="form.good_id"></el-input>
                </el-form-item>
                <el-form-item label="特价价格">
                    <el-input v-model="form.price"></el-input>
                </el-form-item>
            </el-form>

            <span slot="footer" class="dialog-footer">
                <el-button @click="dialogVisible = false">取 消</el-button>
                <el-button type="primary" @click="add">确 定</el-button>
            </span>
        </el-dialog>

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
                pageSize: 20,
                dialogVisible: false,
                dialogTitle: '添加特价商品',
                form: {
                    good_id: '',
                    price: ''
                }
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
            addDialog(){
                this.dialogVisible = true;
                this.dialogTitle = '添加特价商品';
                this.form = {
                    good_id: '',
                    price: ''
                }
            },
            add(){
                let self = this;

                if (self.form.id) {
                    this.$axios.post(service.url('modifySale'), qs.stringify(self.form),{
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                    }).then((res) => {
                        if (res.data.code == 200) {
                            this.$message.success('修改成功');
                            self.dialogVisible = false;
                        }
                    })
                }else{
                    this.$axios.post(service.url('addSale'), qs.stringify(self.form),{
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                    }).then((res) => {
                        if (res.data.code == 200) {
                            this.$message.success('添加成功');
                            self.getData();
                            self.dialogVisible = false;
                        }
                    })
                }
            },
            getData(){
                let self = this;
                
                this.$axios.post(service.url('getSaleList'), qs.stringify({
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

                this.$axios.post(service.url('delSale'), qs.stringify({
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
            },
            edit(index, row) {
                let self = this;
                self.dialogVisible = true;
                self.form = row;
                self.dialogTitle = '修改特价商品';
            }
        }
    }
</script>