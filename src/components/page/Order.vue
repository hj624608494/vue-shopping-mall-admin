<template>
    <div class="table">
        <div class="crumbs">
            <el-row>
                <el-col :span="24">
                    <el-breadcrumb separator="/">
                        <el-breadcrumb-item><i class="el-icon-menu"></i> 订单管理</el-breadcrumb-item>
                        <el-breadcrumb-item>订单管理</el-breadcrumb-item>
                    </el-breadcrumb>
                </el-col>
            </el-row>
        </div>

        <el-table :data="tableData" border style="width: 100%">
            <el-table-column prop="user_id" label="用户ID"></el-table-column>
            <el-table-column prop="id" label="订单ID"></el-table-column>
            <el-table-column prop="order_sn" label="编号"></el-table-column>
            <!-- <el-table-column prop="order_status" label="状态"></el-table-column> -->
            <el-table-column
                prop="order_status"
                label="状态"
                width="100"
                :filters="[{ text: '待发货', value: '待发货' }, { text: '已发货', value: '已发货' }]"
                :filter-method="filterTag">
                <template scope="scope">
                    <el-tag
                        :type="scope.row.order_status === '待发货' ? 'primary' : 'success'"close-transition>{{scope.row.order_status}}</el-tag>
                </template>
            </el-table-column>
            <el-table-column prop="pay_status" label="支付状态"></el-table-column>
            <el-table-column prop="pay_type" label="支付方式"></el-table-column>
            <el-table-column prop="createtime" label="创建时间"></el-table-column>
            <el-table-column prop="order_total" label="订单总价" width="100"></el-table-column>
           
            <el-table-column label="操作" width="100">
                <template scope="scope">
                    <el-button size="small" type="warning"
                        @click="editDialog(scope.$index, scope.row)">修改</el-button>
                </template>
            </el-table-column>
        </el-table>

        <el-dialog :title="dialogTitle" v-model="dialogVisible" size="tiny">
            <el-form ref="form" :model="form" label-width="80px">
                <el-form-item label="发货状态">
                    <el-select v-model="form.order_status" placeholder="请选择">
                        <el-option
                            v-for="item in options"
                            :label="item.value"
                            :value="item.value">
                        </el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="物流公司">
                    <el-input v-model="form.expressName"></el-input>
                </el-form-item>
                <el-form-item label="快递单号">
                    <el-input v-model="form.expressNumber"></el-input>
                </el-form-item>
            </el-form>

            <span slot="footer" class="dialog-footer">
                <el-button @click="dialogVisible = false">取 消</el-button>
                <el-button type="primary" @click="edit">确 定</el-button>
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
                dialogTitle: '修改订单状态',
                form: {
                    order_status: '',
                    expressName: '',
                    expressNumber: ''
                },
                options: [{
                    value: '已发货',
                },{
                    value: '待发货',
                }]
            }
        },
        created(){
            this.getData();
        },
        methods: {
            filterTag(value, row) {
                return row.order_status === value;
            },
            handleCurrentChange(val){
                this.cur_page = val;
                this.getData();
            },
            editDialog(index, row) {
                this.dialogVisible = true;
                this.form = row;
            },
            edit(){
                let self = this;

                this.$axios.post(service.url('modifyOrderStatus'), qs.stringify(self.form),{
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                }).then((res) => {
                    if (res.data.code == 200) {
                        this.$message.success('修改成功');
                        self.dialogVisible = false;
                    }else{
                        this.$message.error(res.data.msg);
                    }
                })
            },
            getData(){
                let self = this;
                
                this.$axios.post(service.url('getMSOrderList'), qs.stringify({
                    num: self.pageSize,
                    currentPage: self.cur_page
                }),{headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                }).then((res) => {
                    if (res.data.code == 200) {
                        self.tableData = res.data.data;
                        self.count || (self.count = res.data.acount);
                    }
                })
            }
        }
    }
</script>