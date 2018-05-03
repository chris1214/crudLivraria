<script>
export default {
  data () {
    return {
      users: [],
      login: {
        user: '',
        password: '',
      },
      http: 'http://localhost:3000/users'
    }
  },
  methods: {
    get(serch) {
      this.$http.get(`${this.http}?${serch}`).then(
         response => {
           this.users = response.body;
         }, error => {
           console.log("Erro");
         }
       )
    },
    getUsers() {
      this.$http.get(`${this.http}`).then(
         response => {
           this.users = response.body;
         }, error => {
           console.log("Erro");
         }
       )
    },
    myLogin() {
      var user = `title=${this.login.user}`;
      this.get(user);
      console.log(user);
      console.log(this.users);
    },
    goToShow () {
      console.log(this.users);
      console.log(this.users.name);
      console.log(this.users.password);
    },
  },
  created(){
      this.getUsers();
  },
}
</script>
<template>
  <div>
    <el-row>
      <el-col :span="12" :offset="6">
        <el-card class="box-card">
          <h1>Login</h1>
          {{users}}
          {{users.name}}
          {{users.password}}
          <el-form label-position="top">
            <el-form-item label="Usuário">
              <el-input v-model="login.user"></el-input>
            </el-form-item>
            <el-form-item label="Senha">
              <el-input v-model="login.password"></el-input>
            </el-form-item>
            <el-form-item>
              <el-row>
                <el-col :span="6">
                  <a>Novo Usuário</a>
                </el-col>
                <el-col :span="6" :offset="12" style="text-aling: rigth;">
                  <a>Esqueci minha senha</a>
                </el-col>
              </el-row>
            </el-form-item>
            <el-form-item>
              <el-button @click="myLogin()">Login</el-button>
            </el-form-item>
          </el-form>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>
<style scoped>
</style>
