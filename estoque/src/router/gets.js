/**
 * Created by christopher on 04/05/18.
 */
export default {
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
    }
  },

}
