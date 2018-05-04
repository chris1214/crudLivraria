<script>
import templateHeader from './templateHeader'
export default{
  data(){
      return{
        estoque: [],
        estoque02: [],
        estoque03: {},

        tiposEquipamentos: [],

        modelos: [],

        statusEquipamentos: [],

        tiposDisponibilizacaoEquipamentos: [],

        datasFIFO: [],

        transportes: [],

        prestadorServicos: [],

        tecnicos: [],

        clientes: [],

        serchResults: {
          numeroSerie: '',
          tipoEquipamento: '',
          modelo: '',
          statusEquipamento: '',
          tipoDisponibilizacaoEquipamento: '',
          dataFIFO: '',
          transportes: '',
          prestadorServico: '',
          tecnico: '',
          cliente: '',
        },
        httpEstoque: 'http://localhost:3000/estoque?',
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
          this.$http.get(`${this.httpModelo}`).then(
            response => {
              console.log('2');
              return  this.modelos = response.body;
            }, error => {
              console.log("Error modelo");
            }
          )
        )
        .then(
          this.$http.get(`${this.httpStatusEquipamentos}`).then(
            response => {
              console.log('3');
              return  this.statusEquipamentos = response.body;
            }, error => {
              console.log("Error estatus equipamento");
            }
          )
        )
        .then(
          this.$http.get(`${this.httpTiposDisponibilizacaoEquipamentos}`).then(
            response => {
              console.log('4');
              return this.tiposDisponibilizacaoEquipamentos = response.body;
            }, error => {
              console.log("Error tipos disponibilização de equipamentos");
            }
          )
        )
        .then(
          this.$http.get(`${this.httpDatasFIFO}`).then(
            response => {
              console.log('5');
              return  this.datasFIFO = response.body;
            }, error => {
              console.log("Error datas FIFO");
            }
          )
        )

        .then(
          this.$http.get(`${this.httpTransportes}`).then(
            response => {
              console.log('6');
              return  this.transportes = response.body;
            }, error => {
              console.log("Error transporte");
            }
          )
        )
        .then(
          this.$http.get(`${this.httpPrestadorServicos}`).then(
            response => {
              console.log('7');
              return  this.prestadorServicos = response.body;
            }, error => {
              console.log("Error prestadorServicos");
            }
          )
        )
        .then(
          this.$http.get(`${this.httpTecnicos}`).then(
            response => {
              console.log('8');
              return  this.tecnicos = response.body;
            }, error => {
              console.log("Error tecnicos");
            }
          )
        )
        .then(
          this.$http.get(`${this.httpClientes}`).then(
            response => {
              console.log('9');
              return  this.clientes = response.body;
            }, error => {
              console.log("Error clientes");
            }
          )
        )
        .then(
          response => {
            console.log('1');
            return this.estoque = response.body
          }, error => {
            console.log("Error estoque");
          }
        )
    },

    serch(numeroSerie = ``, modelo = ``, statusEquipamento = ``,
            tipoDisponibilizacaoEquipamento = ``, dataFIFO = ``) {
      this.$http.get(`${this.httpEstoque}${numeroSerie}${modelo}${statusEquipamento}${tipoDisponibilizacaoEquipamento}${dataFIFO}`).then(
        response => {
          return this.estoque = response.body
        }, error => {
          console.log("Error");
        }
      )
    },
    goToSerch(){
      var numeroSerie = ``;
      var modelo = ``;
      var statusEquipamento = ``;
      var tipoDisponibilizacaoEquipamento = ``;
      var dataFIFO = ``;

      if(!this.serchResults.numeroSerie == ''){
        numeroSerie = `numeroSerie=${this.serchResults.numeroSerie}`;
      }
      if(!this.serchResults.modelo == ''){
        modelo = `&&modelo=${this.serchResults.modelo}`;
      }
      if(!this.serchResults.statusEquipamento == ''){
        statusEquipamento = `&&statusEquipamento=${this.serchResults.statusEquipamento}`;
      }
      if(!this.serchResults.tipoDisponibilizacaoEquipamento == ''){
        tipoDisponibilizacaoEquipamento = `&&tipoDisponibilizacaoEquipamento=${this.serchResults.tipoDisponibilizacaoEquipamento}`;
      }
      if(!this.serchResults.dataFIFO == ''){
        dataFIFO = `&&dataFIFO=${this.serchResults.dataFIFO}`;
      }

      this.serch(numeroSerie, modelo, statusEquipamento, tipoDisponibilizacaoEquipamento, dataFIFO);
    },
    goToEdit(id){
      this.$router.push(`/edit/${id}`);
    },
    myDelete(id){
      this.$http.delete(`${this.httpEstoque}/${id}`).then(
        response=> {
          alert('Item com ID ' + id + ' deletado');
          this.serch();
        }, error=> {
          console.log(`Error`)
        }
      )
    }
  },
  created(){
    this.get();
  }
}
</script>
<template>
  <div>
    <templateHeader title="Controle de Estoque > Lista">
      <el-card>
        <el-collapse>
          <el-collapse-item title="Filtros">
            <el-form :inline="true" label-position="top">
              <el-row>
                <el-col>
                  <el-form-item label="Número de Série">
                    <el-input v-model="serchResults.numeroSerie"></el-input>
                  </el-form-item>

                  <el-form-item label="Tipo de Equipamento">
                    <el-select v-model="serchResults.tipoEquipamento" placeholder="Tipo de Equipamento">
                      <el-option
                        v-for="item in tiposEquipamentos"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value">
                      </el-option>
                    </el-select>
                  </el-form-item>

                  <el-form-item label="Modelo">
                    <el-select v-model="serchResults.modelo" placeholder="Modelo">
                      <el-option
                        v-for="item in modelos"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value">
                      </el-option>
                    </el-select>
                  </el-form-item>

                  <el-form-item label="Status do Equipamento">
                    <el-select v-model="serchResults.statusEquipamento" placeholder="Status do Equipamento">
                      <el-option
                        v-for="item in statusEquipamentos"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value">
                      </el-option>
                    </el-select>
                  </el-form-item>
                </el-col>
              </el-row>
              <el-row>
                <el-col>

                  <el-form-item label="Tipo de Disponibilização de Equipamento">
                    <el-select v-model="serchResults.tipoDisponibilizacaoEquipamento" placeholder="Tipo de Disponibilização de Equipamento">
                      <el-option
                        v-for="item in tiposDisponibilizacaoEquipamentos"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value">
                      </el-option>
                    </el-select>
                  </el-form-item>

                  <el-form-item label="Data FIFO">
                    <el-select v-model="serchResults.dataFIFO" placeholder="Data FIFO">
                      <el-option
                        v-for="item in datasFIFO"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value">
                      </el-option>
                    </el-select>
                  </el-form-item>
                </el-col>
              </el-row>

              <el-row>
                <el-col>
                  <h3>Local</h3>
                  <el-form-item label="Transporte">
                    <el-select v-model="serchResults.transporte" placeholder="Transporte">
                      <el-option
                        v-for="item in transportes"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value">
                      </el-option>
                    </el-select>
                  </el-form-item>

                  <el-form-item label="Prestador de Serviço">
                    <el-select v-model="serchResults.prestadorServico" placeholder="Prestador de Serviço">
                      <el-option
                        v-for="item in prestadorServicos"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value">
                      </el-option>
                    </el-select>
                  </el-form-item>

                  <el-form-item label="Tecnico">
                    <el-select v-model="serchResults.tecnico" placeholder="Tecnico">
                      <el-option
                        v-for="item in tecnicos"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value">
                      </el-option>
                    </el-select>
                  </el-form-item>

                  <el-form-item label="Cliente">
                    <el-select v-model="serchResults.cliente" placeholder="Cliente">
                      <el-option
                        v-for="item in clientes"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value">
                      </el-option>
                    </el-select>
                  </el-form-item>
                </el-col>
              </el-row>

              <el-row>
                <el-col>
                  <el-form-item>
                    <el-button size="mini" @click="goToSerch()">Pesquisar</el-button>
                  </el-form-item>
                </el-col>
              </el-row>

            </el-form>
          </el-collapse-item>
        </el-collapse>
      </el-card>
    </templateHeader>
    <el-card>
      <el-table
        :data="estoque"
        style="width: 100%">
        <el-table-column>
          <template slot-scope="scope">
            <el-button @click="goToEdit(scope.row.id)" size="mini" icon="el-icon-edit"></el-button>
            <el-button @click="myDelete(scope.row.id)" size="mini" icon="el-icon-delete"></el-button>
          </template>
        </el-table-column>
        <el-table-column type="expand">
          <template slot-scope="props">
            <p>Bla</p>
          </template>
        </el-table-column>
        <el-table-column
          label="Local"
          prop="local">
        </el-table-column>
        <el-table-column
          label="Tipo"
          prop="tipo">
        </el-table-column>
        <el-table-column
          label="Modelo"
          prop="modelo">
        </el-table-column>
        <el-table-column
          label="Número de Série / Quantidade"
          prop="numeroSerie">
        </el-table-column>
        <el-table-column
          label="Status do Equipamento"
          prop="statusEquipamento">
        </el-table-column>
        <el-table-column
          label="Data FIFO"
          prop="dataFIFO">
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>
<style>
</style>
