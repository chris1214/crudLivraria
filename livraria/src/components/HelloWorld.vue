<script>
import myTitle from './templateTitle'
export default {
  data () {
    return {
      livros: [],
      filtro: {
        title: '',
        author: ''
      },
      http: 'http://localhost:3000/posts',
    }
  },
  methods: {
    getLivros (search = ''){
      this.$http.get(`${this.http}${search}`).then(
         response=>{
           this.livros = response.body
         },error=>{
           console.log("Erro")
         })
    },
    search () {
        var search = ``;
        var myAuthor = this.filtro.author;
        var myTitle = this.filtro.title;
        if (myTitle && myAuthor){

          search = `?title=${myTitle}&author=${myAuthor}`;

        } else if (myTitle){

          search = `?title=${myTitle}`;

        } else if (myAuthor) {

          search = `?author=${myAuthor}`;

        }
        this.getLivros(search);
    },

    resetForm () {
      this.filtro = {
        title: '',
        author: ''
      }
    },
    routerPush (url){
      this.$router.push(url);
    },

    goToCreate () {
      this.routerPush('/create')
    },

    goToEdit (id) {
      this.routerPush('/edit/' + id)
    },

    goToShow (id) {
      this.routerPush('/show/' + id)
    },

    doDelete(id) {
      this.$http.delete(`${this.http}/${id}`).then(
         response=>{
          this.getLivros(``)
         },error=>{
           console.log("Erro")
         })
    },
  },
  created(){
      this.getLivros()
  },
  components: {
    myTitle
  }
}




</script>
<template>
  <div style="margin: 0 50px;">
    <div>
      <myTitle>
        <el-card>
          <el-collapse>
            <el-collapse-item title="Filtro">
              <el-form :inline="true" label-position="top" label-width="100%">
                <el-form-item label="Titulo">
                  <el-input v-model="filtro.title"></el-input>
                </el-form-item>
                <el-form-item label="Author">
                  <el-input v-model="filtro.author"></el-input>
                </el-form-item>
              </el-form>
              <el-row>
                <el-col :span="3">
                  <el-button @click="search()">Pesquisar</el-button>
                </el-col>
                <el-col :span="3">
                  <el-button @click="goToCreate()">Novo</el-button>
                </el-col>
                <el-col :span="3">
                  <el-button @click="resetForm()">Limpar</el-button>
                </el-col>
              </el-row>
            </el-collapse-item>
          </el-collapse>
        </el-card>
        <el-card>
          <el-table
            :data="livros"
            border
            style="width: 100%">
            <el-table-column
              width="125">
              <template slot-scope="scope">
                <el-button @click="goToEdit(scope.row.id)" type="primary" icon="el-icon-edit" size="mini"></el-button>
                <el-button @click="doDelete(scope.row.id)" type="primary" icon="el-icon-delete"
                           size="mini"></el-button>
                <el-button @click="goToShow(scope.row.id)" type="primary" icon="el-icon-view" size="mini"></el-button>
              </template>
            </el-table-column>
            <el-table-column
              prop="title"
              label="Titulo">
            </el-table-column>
            <el-table-column
              prop="author"
              label="Author">
            </el-table-column>
            <el-table-column
              prop="id"
              label="id">
            </el-table-column>
          </el-table>
        </el-card>
      </myTitle>
    </div>
  </div>
</template>
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
input.el-input__inner {
  height: 30px;
}
label.el-form-item__label {
    padding: 0;
    height: 35px;
}
.el-button--mini, .el-button--mini.is-round {
    padding: 5px 5px;
}
</style>
