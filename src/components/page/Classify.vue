<template>
    <div class="table">
        <div class="crumbs">
            <el-row>
                <el-col :span="21">
                    <el-breadcrumb separator="/">
                        <el-breadcrumb-item><i class="el-icon-menu"></i> 首页管理</el-breadcrumb-item>
                        <el-breadcrumb-item>分类管理</el-breadcrumb-item>
                    </el-breadcrumb>
                </el-col>

                <el-col :span="3">
                    <el-button type="primary" icon="plus" 
                        @click="addDialog">添加分类</el-button>
                </el-col>
            </el-row>
            
        </div>

        <el-table :data="tableData" border style="width: 100%">
            <el-table-column prop="id" label="ID" sortable width="150"></el-table-column>
            <el-table-column label="图片" width="150">
                <template scope="scope">
                    <img @click="dialogImg(scope.row.image)" :src="scope.row.image" width="100%">
                </template>
            </el-table-column>
            <el-table-column prop="text" label="名称" width="150"></el-table-column>
            <el-table-column prop="link" label="链接"></el-table-column>
            <el-table-column prop="sort" label="排序" width="100"></el-table-column>
           
            <el-table-column label="操作" width="180">
                <template scope="scope">
                    <el-button size="small" type="warning"
                        @click="edit(scope.$index, scope.row)">修改</el-button>
                    <el-button size="small" type="danger"
                        @click="del(scope.$index, scope.row)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>

        <el-dialog v-model="dialogVisible" size="large">
            <img :src="dialogImgUrl" style="max-width: 100%;">
        </el-dialog>

        <el-dialog :title="addDialogTitle" v-model="addDialogVisible">
            <el-form ref="form" :model="form" label-width="80px">
                <el-form-item label="名称">
                    <el-input v-model="form.text"></el-input>
                </el-form-item>

                <el-form-item label="图片">
                    <el-upload
                        class="avatar-uploader"
                        action="http://47.93.52.144/index/Slide/doUploadImg"
                        :show-file-list="false"
                        :on-success="handleAvatarScucess"
                        name="imgFile">
                        <img v-if="form.image" :src="form.image" class="avatar">
                        <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                    </el-upload>
                </el-form-item>
                
                <el-form-item label="链接">
                    <el-input v-model="form.link"></el-input>
                </el-form-item>

                <el-form-item label="排序">
                    <el-input v-model="form.sort"></el-input>
                </el-form-item>
            </el-form>

            <span slot="footer" class="dialog-footer">
                <el-button @click="addDialogVisible = false">取 消</el-button>
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
                dialogImgUrl: '',
                addDialogVisible: false,
                addDialogTitle: '添加分类',
                form: {
                    image: '',
                    text: '',
                    link: '',
                    sort: ''
                }
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
            getData(){
                let self = this;

                this.$axios.post(service.url('getClassifyList'),{headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                }).then((res) => {
                    if (res.data.code == 200) {
                        self.tableData = res.data.data;
                    }
                })
            },
            addDialog(){
                this.addDialogVisible = true;
                this.addDialogTitle = '添加分类';
                this.form = {
                    image: '',
                    text: '',
                    link: '',
                    sort: ''
                };
            },
            add(){
                let self = this;

                if (self.form.id) {
                    this.$axios.post(service.url('modifyClassify'), qs.stringify(self.form),{headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                    }).then((res) => {
                        if (res.data.code == 200) {
                            self.getData();
                            self.addDialogVisible = false;
                            self.$message.success('修改成功');
                        }
                    })
                }else{
                    this.$axios.post(service.url('addClassify'), qs.stringify(self.form),{headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                    }).then((res) => {
                        if (res.data.code == 200) {
                            self.getData();
                            self.addDialogVisible = false;
                            self.$message.success('添加成功');
                        }
                    })
                }
            },
            del(index, row) {
                let self = this;

                this.$axios.post(service.url('delClassify'), qs.stringify({
                    id: row.id
                }),{headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                }).then((res) => {
                    if (res.data.code == 200) {
                        this.$message.error('删除成功');
                        self.tableData.splice(index, 1);
                    }
                })   
            },
            handleAvatarScucess(res, file) {
                console.log(res);
                console.log(file);
                this.form.image = res;
            },
            edit(index, row) {
                this.addDialogVisible = true;
                this.addDialogTitle = '修改分类';
                this.form = row;
            }
        }
    }
</script>