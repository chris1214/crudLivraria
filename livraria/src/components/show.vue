<script>
import myTitle from './templateTitle'
export default{
    props: ['id'],
    data(){
        return{
          livro: [],
          http: 'http://localhost:3000/posts',
        }
    },
    components:{
    },
    methods: {
      goToList: function () {
        this.$router.push('/')
      },

      getLivro () {
        this.$http.get(`${this.http}/${this.id}`).then(
         response=>{
           this.livro = response.body
         },error=>{
           console.log("Erro")
         })
      },

      goToEdit () {
        this.$router.push('/edit/' + this.id)
      },

      doDelete() {
      this.$http.delete(`${this.http}/${this.id}`).then(
         response=>{
          this.$router.push('/')
         },error=>{
           console.log("Erro")
         })
      },
    },
    created() {
      this.getLivro();
    },
    components: {
      myTitle
    }
}
</script>
<template>
  <div>
    <myTitle>
      <el-card>
        <el-form :inline="true" label-position="top" label-width="100%">
          <el-form-item label="Titulo">
            <p>{{livro.title}}</p>
          </el-form-item>
          <el-form-item label="Author">
            <p>{{livro.author}}</p>
          </el-form-item>
        </el-form>
        <el-row>
          <el-col :span="3">
            <el-button @click="goToEdit()" type="primary" size="mini">Editar</el-button>
          </el-col>
          <el-col :span="3">
            <el-button type="primary" size="mini" @click="goToList()">Voltar para pesquisa</el-button>
          </el-col>
          <el-col :span="3">
            <el-button type="primary" size="mini" @click="doDelete()">Deletar</el-button>
          </el-col>
        </el-row>
      </el-card>
    </myTitle>
  </div>
</template>
<style>
</style>
