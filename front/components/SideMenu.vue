<template>
  <header>
    <Nuxt />
    <v-navigation-drawer v-model="drawer" fixed temporary>
      <v-list rounded>
        <v-list-item-group>
          <!-- <v-list-item v-for="item in menuItems" :key="item.name"> -->
          <v-list-item
          @click="TitleName"
            v-for="user in users"
            :key="users.id"
            nuxt
          >
            <v-list-item-content>
              <v-list-item-title v-text="user.name"></v-list-item-title>
            </v-list-item-content>
            <!-- <nuxt-link :to="item.id">
                <v-list-item-title>{{ item.name }}</v-list-item-title>
              </nuxt-link> -->
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-navigation-drawer>
    <v-app-bar app>
      <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>
      <v-app-bar-title v-if="title === title">{{ title }}</v-app-bar-title>
    </v-app-bar>
  </header>
</template>

<script>
import axios from "~/plugins/axios"

export default {
  data(){
    return{
      drawer: null,
      title: '',
      name: "",
      users: []
    }
  },
  created() {
    // ユーザーをaxiosで取得
    axios.get("/users").then(res => {
      if (res.data) {
          this.users = res.data
          }
        })
  }

  // computed: {
  //   grobalMenus() {
  //     return this.$store.getters["menu/sidemenuOf"]("index").menus;
  //   },
  //   menus() {
  //     return pageId => {
  //       return this.$store.getters["menu/sidemenuOf"](pageId).menus;
  //     };
  //   },
  // },
  // methods: {
  //   TitleName() {
  //     this.title = this.$route.name.split('-')[1]
  //   },
  //   isSelected(menu) {
  //     return this.$route.url === menu.url
  //   }
  // }
};
</script>
