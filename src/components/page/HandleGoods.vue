<template>
    <div>
        <div class="crumbs">
            <el-breadcrumb separator="/">
                <el-breadcrumb-item><i class="el-icon-menu"></i> 商品管理</el-breadcrumb-item>
                <el-breadcrumb-item>{{navTitle}}</el-breadcrumb-item>
            </el-breadcrumb>
        </div>
        <div class="form-box">
            <el-form ref="form" :model="form" label-width="80px">
                <el-form-item label="商品名称">
                    <el-input v-model="form.name"></el-input>
                </el-form-item>
                
                <el-form-item label="商品价格">
                    <el-input v-model="form.price"></el-input>
                </el-form-item>

                <el-form-item label="商品分类">
                    <el-select v-model="form.cid" placeholder="请选择">
                        <el-option
                            v-for="item in classifyOptions"
                            :label="item.text"
                            :value="item.id">
                        </el-option>
                    </el-select>
                </el-form-item>

                 <el-form-item label="商品属性">
                    <!-- <el-input v-model="form.attr"></el-input> -->
                    <el-form :inline="true" class="demo-form-inline">
                        <el-form-item label="">
                            <el-input v-model="attrName" placeholder="属性名称"></el-input>
                        </el-form-item>
                        
                        <el-form-item>
                            <el-button type="primary" @click="addAttr">添加</el-button>
                        </el-form-item>
                    </el-form>

                    <el-form :inline="true" class="demo-form-inline" v-for="(item,index) in form.attr">
                        <el-form-item label="">
                            <el-dropdown>
                                <el-button type="success">
                                    {{item.name}}<i class="el-icon-caret-bottom el-icon--right"></i>
                                </el-button>
                                <el-dropdown-menu slot="dropdown">
                                    <el-dropdown-item v-for="value in item.valueList">{{value.name}}</el-dropdown-item>
                                </el-dropdown-menu>
                            </el-dropdown>
                        </el-form-item>

                        <el-form-item label="">
                            <el-input v-model="attrValue[index]" placeholder="添加属性值"></el-input>
                        </el-form-item>
                        
                        <el-form-item>
                            <el-button type="primary" @click="addAttrValue(item, index)">添加</el-button>
                        </el-form-item>
                    </el-form>
                </el-form-item>

                <el-form-item label="商品库存">
                    <!-- <el-input v-model="form.number"></el-input> -->
                    <el-form :inline="true" class="demo-form-inline" v-for="item in form.number">
                        <el-form-item label="">
                            <el-input v-model="item.number" placeholder="库存"></el-input>
                        </el-form-item>
                        
                        <el-form-item>
                            <el-button type="warning" v-for="attr in item.attrValues">{{attr}}</el-button>
                        </el-form-item>
                    </el-form>
                </el-form-item>

                <el-form-item label="商品状态">
                    <el-switch 
                        on-text="" 
                        off-text="" 
                        @change="switchChange(form.status)" 
                        v-model="form.status"></el-switch>
                </el-form-item>

                <el-form-item label="商品推荐">
                    <el-switch 
                        on-text="" 
                        off-text="" 
                        @change="switchChange(form.produce)" 
                        v-model="form.produce"></el-switch>
                </el-form-item>
                
                <el-form-item label="商品图片">
                    <el-upload
                        class="upload-demo"
                        action="http://47.93.52.144/index/goodscontroller/doUploadImg"
                        :on-remove="handleRemove"
                        :on-success="handleAvatarSuccess"
                        :file-list="images"
                        list-type="picture"
                        name="imgFile">
                        <el-button size="small" type="primary">点击上传</el-button>
                        <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
                    </el-upload>
                </el-form-item>

                <el-form-item label="商品描述">
                    <el-input v-model="form.introduce"></el-input>
                </el-form-item>
                
                <el-form-item label="商品详情">
                    <quill-editor ref="myTextEditor" v-model="form.content" :config="editorOption"></quill-editor>
                </el-form-item>
                
                <el-form-item>
                    <el-button type="primary" @click="onSubmit">提交</el-button>
                </el-form-item>
            </el-form>
        </div>

    </div>
</template>

<script>
    import { quillEditor } from 'vue-quill-editor';
    import service from '../../assets/service.js'
    import qs from 'qs';

    export default {
        data: function(){
            return {
                editorOption: {
                    // something config
                },
                navTitle: '添加商品',
                form: {
                    name: '',
                    price: '',
                    attr: [],
                    number: {},
                    status: true,
                    images: [],
                    introduce: '',
                    produce: true,
                    content: '',
                    cid: ''
                },
                classifyOptions: [],
                attrName: '',
                attrValue: [],
                images: []
            }
        },
        components: {
            quillEditor
        },
        created(){
            this.getClassifyList();
            let id = this.$route.query.id;

            if (id) {
                this.navTitle = '修改商品';
                this.getGoodById(id);
            }
        },
        methods: {
            getGoodById(id){
                let self = this;

                this.$axios.post(service.url('getGoodsById'),qs.stringify({id: id}),
                    {headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                }).then((res) => {
                    if (res.data.code == 200) {
                        let data = res.data.data;
                        data.images.forEach(function(item, index){
                            self.images.push({
                                url: item
                            });
                        })
                        self.form = data;

                        if (self.form.status === 'true') {
                            self.form.status = true;
                        }else{
                            self.form.status = false;
                        }
                        if (self.form.produce === 'true') {
                            self.form.produce = true;
                        }else{
                            self.form.produce = false;
                        }
                    }
                })
            },
            addAttr(){
                if (!this.attrName) {
                    this.$message.error('请输入属性名称');
                    return;
                }

                this.form.attr.push({
                    name: this.attrName,
                    valueList: []
                })

                this.attrName = '';

                console.log(this.form.attr)
            },
            addAttrValue(item, index){

                item.valueList.push({
                    name: this.attrValue[index]
                })

                this.attrValue[index] = '';

                console.log(item);

                this.concatStock();
            },
            concatStock(){
                var _this = this;
                function countNum(index,zuohekey){
                    var list = _this.form.attr[index].valueList;
                    for(var i=0;i<list.length;i++){

                        if(!_this.form.number[zuohekey+list[i].name]){
                            _this.form.number[zuohekey+list[i].name]=zuohekey==""?
                            {number:0,attrValues:[list[i].name]}:
                            {number:0,attrValues:_this.form.number[zuohekey].attrValues.concat(list[i].name)}
                        }
                        
                        if(i == list.length-1){
                            delete _this.form.number[zuohekey];
                        }
                        if( index < _this.form.attr.length-1){
                            countNum(index+1,zuohekey+list[i].name)
                        }
                    }
                }
                if(this.form.attr.length>0){
                    countNum(0,"");
                }

                console.log(_this.form.number);
            },
            handleRemove(file, fileList) {
                let self = this;
                self.images.forEach(function(item,index){
                    if (file.uid == item.uid) {
                        self.images.splice(index, 1);
                    }
                })
            },
            handleAvatarSuccess(res, file) {
                this.images.push({
                    name: file.name,
                    url: res.data
                })
            },
            onEditorChange({ editor, html, text }) {
                this.content = html;
            },
            onSubmit() {
                console.log(this.form)
                let self = this;
                let id = self.$route.query.id;

                self.form.images = [];
                self.images.forEach(function(item, index){
                    self.form.images.push(item.url);
                })

                if (id) {
                    this.$axios.post(service.url('modifyGoods'), qs.stringify(self.form),{headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                    }).then((res) => {
                        if (res.data.code == 200) {
                            this.$message.success('修改成功！');
                            this.$router.push({ path: 'goods'});
                        }else{
                            this.$message.error(res.data.msg);
                        }
                    })
                }else{
                    this.$axios.post(service.url('addGoods'), qs.stringify(self.form),{headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                    }).then((res) => {
                        if (res.data.code == 200) {
                            this.$message.success('添加成功！');
                            this.$router.push({ path: 'goods'});
                        }else{
                            this.$message.error(res.data.msg);
                        }
                    })
                }
            },
            getClassifyList(){
                let self = this;
                
                this.$axios.post(service.url('getClassifyList'),{headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                }).then((res) => {
                    if (res.data.code == 200) {
                        self.classifyOptions = res.data.data;
                    }
                })
            },
            switchChange(bool){
                bool = !bool;
            }
        },
        computed: {
            editor() {
                return this.$refs.myTextEditor.quillEditor;
            }
        }
    }
</script>

<style>
    .demo-form-inline{
        margin-bottom: 10px;
    }
</style>