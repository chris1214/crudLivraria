<script>
export default{
  props: ['title'],
  data(){
      return{
      }
  },
  components:{
  }
}
</script>
<template>
  <div>
    <div>
      <h1>{{title}}</h1>
    </div>
    <div>
      <slot></slot>
    </div>
  </div>
</template>
<style>
</style>
