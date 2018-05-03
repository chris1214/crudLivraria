<script>
import templateHeader from './templateHeader'
export default{
  data(){
      return{
      }
  },
  components:{
    templateHeader
  }
}


</script>
<template>
  <div>
    <templateHeader title="Controle de Estoque > Detalhes">
      <el-card>
        <el-row>
          <el-col :span="6">
            <p><b>Local</b></p>
            <p>Transp Nac</p>
          </el-col>
          <el-col :span="6">
            <p><b>Tipo de Equipamento</b></p>
            <p>ANTENNA</p>
          </el-col>
          <el-col :span="6">
            <p><b>Tipo de Equipamento (Código)</b></p>
            <p>TIPO-EQTO</p>
          </el-col>
          <el-col :span="6">
            <p><b>Número de Série</b></p>
            <p>0987654</p>
          </el-col>
        </el-row>

        <el-row>
          <el-col :span="6">
            <p><b>Modelo</b></p>
            <p>Ant 75m</p>
          </el-col>
          <el-col :span="6">
            <p><b>Modelo (Código)</b></p>
            <p>ANT1234</p>
          </el-col>
          <el-col :span="6">
            <p><b>Família de Produtos</b></p>
            <p>Nome da Familia</p>
          </el-col>
          <el-col :span="6">
            <p><b>Fabricante</b></p>
            <p>Nome do Fabricante</p>
          </el-col>
        </el-row>

        <el-row>
          <el-col :span="6">
            <p><b>Status do Equipamento</b></p>
            <p>Transito - N x R</p>
          </el-col>
          <el-col :span="6">
            <p><b>Data FIFO</b></p>
            <p>20180111-MAN</p>
          </el-col>
          <el-col :span="6">
            <p><b>Situação do Equipamento</b></p>
            <p>Valor da Situação</p>
          </el-col>
          <el-col :span="6">
            <p><b>Tipo de Disponibilização de Equipamento</b></p>
            <p>Venda</p>
          </el-col>
        </el-row>

        <el-row>
          <el-col :span="6">
            <p><b>Última NF</b></p>
            <p>374</p>
          </el-col>
          <el-col :span="6">
            <p><b>Evento que alterou Local ou Status</b></p>
            <p>Ordem de Remessa - 2300</p>
          </el-col>
          <el-col :span="6">
            <p><b>Data do evento que alterou Local ou Status</b></p>
            <p>20/02/2018 15:40</p>
          </el-col>
        </el-row>

        <el-row>
          <el-col :span="6">
            <p><b>Criado em</b></p>
            <p>01/09/2017 07:43:30</p>
          </el-col>
          <el-col :span="6">
            <p><b>Criado por</b></p>
            <p>Usuário 123</p>
          </el-col>
          <el-col :span="6">
            <p><b>Editado em</b></p>
            <p>10/11/2018 12:56:01</p>
          </el-col>
          <el-col :span="6">
            <p><b>Editado por</b></p>
            <p>Usuário 456</p>
          </el-col>
        </el-row>

        <el-row>
          <el-col :span="4">
            <el-button size="mini">Voltar para pesquisa</el-button>
          </el-col>
          <el-col :span="4">
            <el-button size="mini">Editar</el-button>
          </el-col>
        </el-row>
      </el-card>
    </templateHeader>
  </div>
</template>
<style>
</style>
