<script type="text/javascript">
    const equipmentTypeList = {
        template: '#equipmentTypeList',
        data: function () {
            return {
                state: {
                    stateName: "equipmentTypeList",
                    uri: "/equipmentType/list",
                    filter: {
                        itemsPerPage: 25,
                        currentPage: 1,
                        name: '',
                        familyId: null,
                        code: ''
                    },
                    submitted: false,
                    clickFromButton: false
                },
                result: {
                    list: [],
                    pagination: {}
                },
                collapseActiveName: 'filter'
            }
        },
        created: function () {
            _appState.getState(this.state).then($response => {
                this.state = $response;
                if (this.state.submitted) {
                    this.search();
                }
            });
        },
        methods: {
            search: function ($clickFromButton) {
                this.state.clickFromButton = $clickFromButton;
                _util.doSearch(this.state, this.result);
            },
            goToCreate: function () {
                this.$router.push('/create');
            },
            doDelete: function ($instance) {
                _util.delete({
                    uri: "/equipmentType/delete/" + $instance.id
                }).then(() => {
                    this.search();
                });
            },
            setItemsPerPage: function (val) {
                this.state.filter.itemsPerPage = val;
                _util.setItemsPerPage(this.state, this.result);
            },
            setPage: function (val) {
                this.state.filter.currentPage = val;
                _util.setPage(this.state, this.result);
            },
            resetForm: function() {
                Object.assign(this.$data.state.filter, this.$options.data().state.filter);
            }
        }
    }
</script>

<script type="text/x-template" id="equipmentTypeList">

<div>

    <div class="panel">
        <el-collapse v-model="collapseActiveName">
            <el-collapse-item title="${g.message(code: 'default.filters.label')}" name="filter">

                <el-form label-position="top" :model="state.filter">

                    <div class="row">
                        <div class="col-md-3">
                            <el-form-item label="${g.message(code: 'default.name.label')}">
                                <el-input v-model="state.filter.name"></el-input>
                            </el-form-item>
                        </div>

                        <div class="col-md-3">
                            <el-form-item label="${g.message(code: 'default.family.label')}">
                                <family-select v-model="state.filter.familyId"/>
                            </el-form-item>
                        </div>

                        <div class="col-md-3">
                            <el-form-item label="${g.message(code: 'default.code.label')}">
                                <el-input v-model="state.filter.code"></el-input>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">

                            <el-button-group>
                                <el-button type="primary" size="small" @click="search(true)">
                                    <i class="fa fa-search fa-fw"></i>
                                    ${g.message(code: 'default.button.search.label')}
                                </el-button>
                                <el-button type="default" size="small" @click="goToCreate()">
                                    <i class="fa fa-file-o fa-fw"></i>
                                    ${g.message(code: 'default.button.new.label')}
                                </el-button>
                            </el-button-group>

                            <el-button type="default" size="small" @click="resetForm()" class="pull-right">
                                <i class="fa fa-file-o fa-trash"></i>
                                ${g.message(code: 'default.button.clean.label')}
                            </el-button>
                        </div>
                    </div>

                </el-form>

            </el-collapse-item>
        </el-collapse>

    </div>

    %{--<pre>{{state.filter}}</pre>--}%

    <div class="panel">
        <div class="panel-body">

            <el-row :gutter="10" class="margin-bottom-15">
                <el-col :md="24" :xs="24">
                    <pagination
                            :pagination="result.pagination"
                            @change-page="setPage"
                            @change-items-per-page="setItemsPerPage">
                    </pagination>
                </el-col>
            </el-row>

            <el-table
                    stripe
                    :data="result.list"
                    style="width: 100%">
                <el-table-column width="160">
                    <template scope="scope">
                        <router-link
                                :to="'/show/' + scope.row.id"
                                class="btn btn-icon btn-hover-success fa fa-eye fa-lg"
                                title="${g.message(code: 'default.action.show')}">

                        </router-link>
                        <router-link
                                :to="'edit/' + scope.row.id"
                                class="btn btn-icon btn-hover-warning fa fa-edit fa-lg"
                                title="${g.message(code: 'default.action.edit')}">
                        </router-link>
                        <a
                                @click.prevent="doDelete(scope.row)"
                                href="#"
                                class="btn btn-icon btn-hover-danger fa fa-remove fa-lg"
                                title="${g.message(code: 'default.action.delete')}">
                        </a>
                    </template>
                </el-table-column>
                <el-table-column
                        prop="name"
                        label="${g.message(code: 'default.name.label')}">
                </el-table-column>
                <el-table-column
                        label="${g.message(code: 'default.family.label')}">
                    <template scope="scope">
                        {{scope.row.family.label}}
                    </template>
                </el-table-column>
                <el-table-column
                        prop="code"
                        label="${g.message(code: 'default.code.label')}">
                </el-table-column>
            </el-table>

        </div>
    </div>

</div>
</script>