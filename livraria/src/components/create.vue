<script>
import myTitle from './templateTitle'
export default{
    data(){
        return{
          myForm: {
            title: '',
            author: ''
          },
          rules: {
            title: [{
              required: true,
              trigger: 'blur'
            }],
            author: [{
              required: true,
              trigger: 'blur'
            }]
          }
        }
    },
    components:{
    },
    methods: {
      save: function () {
        if (!this.myForm.title == "" && !this.myForm.author == ""){
           this.$http.post(`http://localhost:3000/posts`, this.myForm).then(
           response=>{
             this.$router.push('/')
           },error=>{
             console.log("Erro")
           })
        }else{
          alert("Nem um campo pode estar vazio")
        }
      },
      goToList: function () {
        this.$router.push('/')
      }
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
        <el-form :rules="rules" :inline="true" label-position="top" label-width="100%">
          <el-form-item label="Titulo" prop="title">
            <el-input v-model="myForm.title"></el-input>
          </el-form-item>
          <el-form-item label="Author" prop="author">
            <el-input v-model="myForm.author"></el-input>
          </el-form-item>
        </el-form>
        <el-row>
          <el-col :span="3">
            <el-button type="primary" size="mini" @click="save()">Salvar</el-button>
          </el-col>
          <el-col :span="3">
            <el-button type="primary" size="mini" @click="goToList()">Voltar para pesquisa</el-button>
          </el-col>
        </el-row>
      </el-card>
    </myTitle>
  </div>
</template>
<style>
</style>
