<script>
    const equipmentTypeShow = {
        template: '#equipmentTypeShow',
        data: function () {
            return {
                instance: {
                    id: null,
                    version: null,
                    name: '',
                    'family.id': null,
                    code: ''
                }
            }
        },
        computed: {
            family: function () {
                if (this.instance.family) {

                    return this.instance.family.label
                }
                return ''
            }
        },
        mounted: function () {

            this.$loading({fullscreen: true, loading: true});

            let uri = this._global().url + "/equipmentType/show/" + this.$route.params.id;

            return axios.get(uri)
                    .then(response => {
                        this.instance = response.data.data;
                        this.$loading().close();
                    });
        },
        methods: {
            goToEdit: function () {
                this.$router.push('/edit/' + this.instance.id);
            },
            goToList: function () {
                this.$router.push('/');
            }
        }
    }
</script>
<script type="text/x-template" id="equipmentTypeShow">
<div>
    <el-tabs type="border-card">
        <el-tab-pane label="${g.message(code: 'default.details.label')}">

            <div class="tab-body">

                <div class="row">
                    <div class="col-md-3">
                        <strong>${g.message(code: 'default.name.label')}</strong>
                        <p>{{instance.name}}</p>
                    </div>

                    <div class="col-md-3">
                        <strong>${g.message(code: 'default.family.label')}</strong>
                        <p>{{family}}</p>
                    </div>

                    <div class="col-md-3">
                        <strong>${g.message(code: 'default.code.label')}</strong>
                        <p>{{instance.code}}</p>
                    </div>
                </div>

            </div>

            <div class="tab-action">
                <div class="row">
                    <div class="col-md-12">
                        <el-button-group>
                            <el-button type="primary" size="small" @click="goToEdit()">
                                <i class="fa fa-edit fa-fw"></i>
                                ${g.message(code: 'default.button.edit.label')}
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