<script>
    const equipmentTypeForm = {
        template: '#equipmentTypeForm',
        data: function () {
            return {
                payload: {
                    instance: {
                        id: '',
                        version: '',
                        name: '',
                        family_id: '',
                        code: ''
                    },
                    uri: '/equipmentType',
                    showRouter: '/show',
                    errors: {},
                    context: this
                },
                rules: {
                    name: [
                        {
                            required: true,
                            message: "${g.message(code: 'validation.required')}",
                            trigger: 'blur'
                        },
                        {
                            min: 3,
                            max: 50,
                            message: "${g.message(code: 'validation.minAndMax', args: [3, 50])}",
                            trigger: 'blur'
                        }
                    ],
                    family_id: [
                        {
                            type: 'number',
                            required: true,
                            message: "${g.message(code: 'validation.required')}",
                            trigger: 'change'
                        }
                    ],
                    code: [
                        {
                            min: 3,
                            max: 50,
                            message: "${g.message(code: 'validation.minAndMax', args: [3, 50])}",
                            trigger: 'blur'
                        }
                    ]
                }
            }
        },
        computed: {
            tabLabel: function () {
                return this.$route.params.id ?
                    "${g.message(code: 'default.button.edit.label')}" :
                    "${g.message(code: 'default.button.new.label')}"
            }
        },
        mounted: function () {

            let id = this.$route.params.id;

            if (id) {

                _util.loadingShow();

                let uri = this._global().url + "/equipmentType/show/" + id;

                return axios.get(uri)
                        .then(response => {
                            Object.assign(this.payload.instance, response.data.data);
                            this.payload.instance.family_id = response.data.data.family.id;
                            _util.loadingHide();
                        });
            }
        },
        methods: {
            goToShow: function () {
                this.$router.push('/show/' + this.payload.instance.id);
            },
            goToList: function () {
                this.$router.push('/');
            },
            save: function () {
                this.$refs['ruleForm'].validate((valid) => {
                    if (valid) {
                        let payload = this.payload;

                        /* params */
                        let context = payload.context;
                        let uri = payload.uri;
                        let instance = payload.instance;

                        instance["family.id"] = instance.family_id;

                        let showRouter = payload.showRouter;

                        _util.loadingShow();

                        let httpOptions = {
                            method: 'post',
                            url: this._global().url + uri,
                            data: JSON.stringify(instance)
                        };

                        if (instance.id) {
                            httpOptions.method = "put";
                            httpOptions.url += "/update/" + instance.id;
                        } else {
                            httpOptions.url += "/save";
                        }

                        return axios(httpOptions).then(response => {
                            return response.data;
                        }).then(response => {

                            let code = response.meta.code;

                            if (code == 200 || code == 201) {

                                this.$eventBus.$emit('notification-success-create-or-update', code);

                                if (showRouter != undefined) {
                                    context.$router.push(showRouter + "/" + response.data.id);
                                }

                            } else if (code === 400) {
                                this.payload.errors = response.errors;
                            }

                            _util.loadingHide();
                        });

                    } else {
                        return false;
                    }
                });
            }
        }
    }
</script>

<script type="text/x-template" id="equipmentTypeForm">
<div>
    <el-tabs type="border-card">
        <el-tab-pane :label="tabLabel">

            <div class="tab-body">

                <alert-errors :errors="payload.errors"/>

                <el-form label-position="top" :model="payload.instance" :rules="rules" ref="ruleForm">

                    <div class="row">
                        <div class="col-md-3">
                            <el-form-item label="${g.message(code: 'default.name.label')}" prop="name">
                                <el-input v-model="payload.instance.name"></el-input>
                            </el-form-item>
                        </div>

                        <div class="col-md-3">
                            <el-form-item label="${g.message(code: 'default.family.label')}" prop="family_id">
                                <family-select v-model="payload.instance.family_id"/>
                            </el-form-item>
                        </div>

                        <div class="col-md-3">
                            <el-form-item label="${g.message(code: 'default.code.label')}" prop="code">
                                <el-input v-model="payload.instance.code"></el-input>
                            </el-form-item>
                        </div>
                    </div>

                </el-form>

            </div>


            <div class="tab-action">

                <div class="row">
                    <div class="col-md-12">

                        <el-button-group>
                            <el-button type="primary" size="small" @click="save()">
                                <i class="fa fa-check fa-fw"></i>
                                <span v-if="!payload.instance.id">${g.message(code: 'default.button.save.label')}</span>
                                <span v-if="payload.instance.id">${g.message(code: 'default.button.update.label')}</span>
                            </el-button>
                            <el-button type="default" size="small" @click="goToShow()" v-if="payload.instance.id">
                                <i class="fa fa-eye fa-fw"></i>
                                ${g.message(code: 'default.button.backToDetail.label')}
                            </el-button>
                            <el-button type="default" size="small" @click="goToList()">
                                <i class="fa fa-table fa-fw"></i>
                                ${g.message(code: 'default.button.backToSearch.label')}
                            </el-button>
                        </el-button-group>

                    </div>
                </div>

            </div>

        </el-tab-pane>
    </el-tabs>
</div>
</script>