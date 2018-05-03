<script>
import templateHeader from './templateHeader'
export default{
  data(){
      return{
        tiposEquipamentos: [{
          value: 'tiposEquipamentos1',
          label: 'Tipo de Equipamento 1'
        }, {
          value: 'tiposEquipamentos2',
          label: 'Tipo de Equipamento 2'
        }, {
          value: 'tiposEquipamentos3',
          label: 'Tipo de Equipamento 3'
        }],

        modelos: [{
          value: 'modelo1',
          label: 'Modelo 1'
        }, {
          value: 'modelo2',
          label: 'Modelo 2'
        }, {
          value: 'modelo3',
          label: 'Modelo 3'
        }],

        statusEquipamentos: [{
          value: 'statusEquipamento1',
          label: 'Status do Equipamento 1'
        }, {
          value: 'statusEquipamento2',
          label: 'Status do Equipamento 2'
        }, {
          value: 'statusEquipamento3',
          label: 'Status do Equipamento 3'
        }],

        tiposDisponibilizacaoEquipamentos: [{
          value: 'tipoDisponibilizacaoEquipamento1',
          label: 'Tipo de Disponibilização de Equipamento 1'
        }, {
          value: 'tipoDisponibilizacaoEquipamento2',
          label: 'Tipo de Disponibilização de Equipamento 2'
        }, {
          value: 'tipoDisponibilizacaoEquipamento3',
          label: 'Tipo de Disponibilização de Equipamento 3'
        }],

        datasFIFO: [{
          value: 'dataFIFO1',
          label: 'Data FIFO 1'
        }, {
          value: 'dataFIFO2',
          label: 'Data FIFO 2'
        }, {
          value: 'dataFIFO3',
          label: 'Data FIFO 3'
        }],

        transportes: [{
          value: 'dataFIFO1',
          label: 'Data FIFO 1'
        }, {
          value: 'dataFIFO2',
          label: 'Data FIFO 2'
        }, {
          value: 'dataFIFO3',
          label: 'Data FIFO 3'
        }],

        prestadorServicos: [{
          value: 'dataFIFO1',
          label: 'Data FIFO 1'
        }, {
          value: 'dataFIFO2',
          label: 'Data FIFO 2'
        }, {
          value: 'dataFIFO3',
          label: 'Data FIFO 3'
        }],

        tecnicos: [{
          value: 'dataFIFO1',
          label: 'Data FIFO 1'
        }, {
          value: 'dataFIFO2',
          label: 'Data FIFO 2'
        }, {
          value: 'dataFIFO3',
          label: 'Data FIFO 3'
        }],

        clientes: [{
          value: 'dataFIFO1',
          label: 'Data FIFO 1'
        }, {
          value: 'dataFIFO2',
          label: 'Data FIFO 2'
        }, {
          value: 'dataFIFO3',
          label: 'Data FIFO 3'
        }],

        estoque: [],

        serchResults: {
          numeroSerie: '',
          tipoEquipamento: '',
          modelo: '',
          statusEquipamento: '',
          tipoDisponibilizacaoEquipamento: '',
          dataFIFO: '',
          transporte: '',
          prestadorServico: '',
          tecnico: '',
          cliente: '',
        },
        http: 'http://localhost:3000/estoque',
      }
  },
  components:{
    templateHeader
  },
  methods: {
    getEstoque (){
      this.$http.get(`${this.http}`).then(
        response => {
          this.estoque = response.body
        }, error => {
          console.log("Error");
        }
      )
    },
    serch(object = ``) {
      this.$http.get(`${this.http}${object}`).then(
        response => {
          this.estoque = response.body
        }, error => {
          console.log("Error");
        }
      )
    },
    goToSerch(){
      var numeroSerie = `?local=${this.serchResults.numeroSerie}`;
      var tipoEquipamento = this.serchResults.tipoEquipamento;
      var modelo = this.serchResults.modelo;
      var statusEquipamento = this.serchResults.statusEquipamento;
      var tipoDisponibilizacaoEquipamento = this.serchResults.tipoDisponibilizacaoEquipamento;
      var dataFIFO = this.serchResults.dataFIFO;
      var transporte = this.serchResults.transporte;
      var prestadorServico = this.serchResults.prestadorServico;
      var cliente = this.serchResults.cliente;

      this.serch(numeroSerie);
    }
  },
  created(){
    this.getEstoque();
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
          <template slot-scope="props">
            <el-button size="mini">Icon</el-button>
            <el-button size="mini">Icon</el-button>
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
