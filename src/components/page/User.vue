<template>
    <div class="table">
        <div class="crumbs">
            <el-breadcrumb separator="/">
                <el-breadcrumb-item><i class="el-icon-menu"></i> 用户管理</el-breadcrumb-item>
                <el-breadcrumb-item>用户</el-breadcrumb-item>
            </el-breadcrumb>
        </div>

        <el-table :data="tableData" border style="width: 100%">
            <el-table-column prop="id" label="ID" sortable width="150">
            </el-table-column>
            <el-table-column prop="email" label="用户名" width="250">
            </el-table-column>
            <el-table-column prop="createtime" label="创建时间"></el-table-column>
           
            <el-table-column label="操作" width="180">
                <template scope="scope">
                    <el-button size="small" type="danger"
                            @click="handleDelete(scope.$index, scope.row)">删除</el-button>
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

                this.$axios.post(service.url('userList'), qs.stringify({
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
            handleDelete(index, row) {
                let self = this;

                this.$axios.post(service.url('doDeleteUser'), qs.stringify({
                    id: row.id
                }),{headers: {'Content-Type': 'application/x-www-form-urlencoded'},
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