<script>
import templateHeader from './templateHeader'
export default{
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

        situacoesEquipamentos: [{
          value: 'situacaoEquipamento1',
          label: 'Status do Equipamento 1'
        }, {
          value: 'situacaoEquipamento2',
          label: 'Status do Equipamento 2'
        }, {
          value: 'situacaoEquipamento3',
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

        local: '',
        modelo: '',
        statusEquipamento: '',
        numeroSerie: '',
        dataFIFO: '',
        situacaoEquipamento: '',
        tipoDisponibilizacaoEquipamento: '',
      }
  },
  components:{
    templateHeader
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
                <el-button size="mini">Voltar para detalhes</el-button>
              </el-form-item>

              <el-form-item>
                <el-button size="mini">Voltar para pesquisa</el-button>
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
