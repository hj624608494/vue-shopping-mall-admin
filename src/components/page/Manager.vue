<template>
    <div class="table">
        <div class="crumbs">
            <el-row>
                <el-col :span="21">
                    <el-breadcrumb separator="/">
                        <el-breadcrumb-item><i class="el-icon-menu"></i> 用户管理</el-breadcrumb-item>
                        <el-breadcrumb-item>管理员</el-breadcrumb-item>
                    </el-breadcrumb>
                </el-col>

                <el-col :span="3">
                    <el-button type="primary" icon="plus" @click="dialogVisible = true">添加管理员</el-button>
                </el-col>
            </el-row>
        </div>

        <el-table :data="tableData" border style="width: 100%">
            <el-table-column prop="id" label="ID" sortable width="150">
            </el-table-column>
            <el-table-column prop="username" label="用户名" width="120">
            </el-table-column>
            <el-table-column prop="createtime" label="创建时间"></el-table-column>
           
            <el-table-column label="操作" width="180">
                <template scope="scope">
                    <el-button size="small" type="danger"
                            @click="handleDelete(scope.$index, scope.row)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>

        <el-dialog title="添加管理员" v-model="dialogVisible" size="tiny">
            <el-form ref="form" :model="form" label-width="80px">
                <el-form-item label="用户名">
                    <el-input v-model="form.username"></el-input>
                </el-form-item>
                <el-form-item label="密码">
                    <el-input v-model="form.password"></el-input>
                </el-form-item>
            </el-form>

            <span slot="footer" class="dialog-footer">
                <el-button @click="dialogVisible = false">取 消</el-button>
                <el-button type="primary" @click="add">确 定</el-button>
            </span>
        </el-dialog>

    </div>
</template>

<script>
    import service from '../../assets/service.js'
    import qs from 'qs';

    export default {
        data() {
            return {
                tableData: [],
                dialogVisible: false,
                form: {
                    username: '',
                    password: ''
                }
            }
        },
        created(){
            this.getData();
        },
        methods: {
            add(){
                let self = this;

                this.$axios.post(service.url('doRegister'), qs.stringify(self.form),{
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
            },
            getData(){
                let self = this;
                this.$axios.post(service.url('managerList')).then((res) => {
                    self.tableData = res.data.data;
                })
            },
            handleDelete(index, row) {
                let self = this;

                this.$axios.post(service.url('doDeleteManager'), qs.stringify({
                    id: row.id
                }),{
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                }).then((res) => {
                    if (res.data.code == 200) {
                        this.$message.error(res.data.msg);
                        self.tableData.splice(index, 1);
                    }else{
                        this.$message.error(res.data.msg);
                    }
                })
                
            }
        }
    }
</script>