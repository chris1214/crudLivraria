<script>
import templateHeader from './templateHeader'
export default{
  props: ['id'],
  data(){
      return{
        locais: [{
          value: 'local1',
          label: 'Local 1'
        }, {
          value: 'local2',
          label: 'Local 2'
        }, {
          value: 'local3',
          label: 'Local 3'
        }],
        modelos: [],

        statusEquipamentos: [],

        datasFIFO: [],

        situacoesEquipamentos: [],

        tiposDisponibilizacaoEquipamentos: [],

        local: '',
        modelo: '',
        statusEquipamento: '',
        numeroSerie: '',
        dataFIFO: '',
        situacaoEquipamento: '',
        tipoDisponibilizacaoEquipamento: '',

        httpModelo: 'http://localhost:3000/modelo',
        httpStatusEquipamentos: 'http://localhost:3000/statusEquipamentos',
        httpTiposDisponibilizacaoEquipamentos: 'http://localhost:3000/tiposDisponibilizacaoEquipamentos',
        httpDatasFIFO: 'http://localhost:3000/datasFIFO',
        httpTransportes: 'http://localhost:3000/transportes',
        httpPrestadorServicos: 'http://localhost:3000/prestadorServicos',
        httpTecnicos: 'http://localhost:3000/tecnicos',
        httpClientes: 'http://localhost:3000/clientes',
      }
  },
  components:{
    templateHeader
  },
  methods: {
    get(){
      this.$http.get(`${this.httpEstoque}`)
        .then(
          response => {
            return this.estoque = response.body
          }, error => {
            console.log("Error estoque");
          }
        )
        .then(
          this.$http.get(`${this.httpModelo}`).then(
            response => {
              return  this.modelos = response.body;
            }, error => {
              console.log("Error modelo");
            }
          )
        )
        .then(
          this.$http.get(`${this.httpStatusEquipamentos}`).then(
            response => {
              return  this.statusEquipamentos = response.body;
            }, error => {
              console.log("Error estatus equipamento");
            }
          )
        )
        .then(
          this.$http.get(`${this.httpTiposDisponibilizacaoEquipamentos}`).then(
            response => {
              return this.tiposDisponibilizacaoEquipamentos = response.body;
            }, error => {
              console.log("Error tipos disponibilização de equipamentos");
            }
          )
        )
        .then(
          this.$http.get(`${this.httpDatasFIFO}`).then(
            response => {
              return  this.datasFIFO = response.body;
            }, error => {
              console.log("Error datas FIFO");
            }
          )
        )

        .then(
          this.$http.get(`${this.httpTransportes}`).then(
            response => {
              return  this.transportes = response.body;
            }, error => {
              console.log("Error transporte");
            }
          )
        )
        .then(
          this.$http.get(`${this.httpPrestadorServicos}`).then(
            response => {
              return  this.prestadorServicos = response.body;
            }, error => {
              console.log("Error prestadorServicos");
            }
          )
        )
        .then(
          this.$http.get(`${this.httpTecnicos}`).then(
            response => {
              return  this.tecnicos = response.body;
            }, error => {
              console.log("Error tecnicos");
            }
          )
        )
        .then(
          this.$http.get(`${this.httpClientes}`).then(
            response => {
              return  this.clientes = response.body;
            }, error => {
              console.log("Error clientes");
            }
          )
        )
    },
    goToShow(){
      this.$router.push(`/show/${this.id}`)
    },
    goToList() {
        this.$router.push('/')
      },
  },
  created(){
    this.get();
  }
}

</script>
<template>
  <div>
    <templateHeader title="Controle de Estoque > Editar">
      <el-card>
        <el-form :inline="true" label-position="top">
          <el-row>
            <el-col>
              <el-form-item label="Local">
                <el-select v-model="local" placeholder="Local">
                  <el-option
                    v-for="item in locais"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value">
                  </el-option>
                </el-select>
              </el-form-item>
              <el-form-item label="Modelo">
                <el-select v-model="modelo" placeholder="Modelo">
                  <el-option
                    v-for="item in modelos"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value">
                  </el-option>
                </el-select>
              </el-form-item>
              <el-form-item label="Status do Equipamento">
                <el-select v-model="statusEquipamento" placeholder="Status do Equipamento">
                  <el-option
                    v-for="item in statusEquipamentos"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value">
                  </el-option>
                </el-select>
              </el-form-item>
              <el-form-item label="Número de Série">
                <el-input></el-input>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col>
              <el-form-item label="Data FIFO">
                <el-select v-model="dataFIFO" placeholder="Data FIFO">
                  <el-option
                    v-for="item in datasFIFO"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value">
                  </el-option>
                </el-select>
              </el-form-item>

              <el-form-item label="Situação do Equipamento">
                <el-select v-model="situacaoEquipamento" placeholder="Situação do Equipamento">
                  <el-option
                    v-for="item in situacoesEquipamentos"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value">
                  </el-option>
                </el-select>
              </el-form-item>

              <el-form-item label="Tipo de Disponibilização de Equipamento">
                <el-select v-model="tipoDisponibilizacaoEquipamento" placeholder="Tipo de Disponibilização de Equipamento">
                  <el-option
                    v-for="item in tiposDisponibilizacaoEquipamentos"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value">
                  </el-option>
                </el-select>
              </el-form-item>

              <el-form-item label="Última NF">
                <el-input></el-input>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col>
              <el-form-item>
                <el-button size="mini">Salvar</el-button>
              </el-form-item>

              <el-form-item>
                <el-button @click="goToShow()" size="mini">Voltar para detalhes</el-button>
              </el-form-item>

              <el-form-item>
                <el-button @click="goToList()" size="mini">Voltar para pesquisa</el-button>
              </el-form-item>
            </el-col>
          </el-row>

        </el-form>
      </el-card>
    </templateHeader>
  </div>
</template>
<style>
</style>
