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
      voltar: function () {
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
      putSalvar () {
        this.$http.put(`${this.http}/${this.id}`, this.livro).then(
         response=>{
           this.$router.push('/')
         },error=>{
           console.log("Erro")
         })
      },
      doDelete() {
      this.$http.delete(`${this.http}/${this.id}`).then(
         response=>{
          console.log("TRue")
          this.getLivros(``)
         },error=>{
           console.log("Erro")
         })
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
              <el-input v-model="livro.title"></el-input>
            </el-form-item>
            <el-form-item label="Author">
              <el-input v-model="livro.author"></el-input>
            </el-form-item>
          </el-form>
          <el-row>
            <el-col :span="3">
              <el-button @click="putSalvar()" type="primary" size="mini">Salvar</el-button>
            </el-col>
            <el-col :span="4">
              <el-button type="primary" size="mini" @click="voltar()">Voltar para pesquisa</el-button>
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
