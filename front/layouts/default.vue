<template>
  <header>
    <Nuxt />
    <v-navigation-drawer v-model="drawer" fixed temporary>
      <v-list rounded>
        <v-list-item-group>
          <!-- <v-list-item v-for="item in menuItems" :key="item.name"> -->
          <v-list-item
            v-for="user in users"
            :key="user"
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
        <v-bottom-sheet v-model="sheet" inset>
          <template v-slot:activator="{ on, attrs }">
            <v-btn color="orange" dark v-bind="attrs" v-on="on">
              Add User
            </v-btn>
          </template>
          <v-sheet class="text-center" height="200px">
            <v-text-field
        label="Username"
        v-model="name"
        prepend-icon=""
        type="text"
        />
         <v-btn color="primary" @click="createUser">ADD USER</v-btn>
        <v-btn text color="error" @click="sheet = !sheet">
          close
        </v-btn>
          </v-sheet>
        </v-bottom-sheet>
      </v-list>
    </v-navigation-drawer>
    <v-app-bar app>
      <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>
    </v-app-bar>
  </header>
</template>

<script>
import axios from "~/plugins/axios"

export default {
  data(){
    return{
      drawer: null,
      name: "",
      users: [],
      sheet: false
    }
  },
  created() {
    // ユーザーをaxiosで取得
    axios.get("/users").then(res => {
      if (res.data) {
          this.users = res.data
          }
        })
  },
  methods: {
    // ユーザーをaxiosで登録
    createUser(){
      axios.post("/users", {name: this.name})
    .then(res => {
      if (res.data) {
          this.users.push(res.data)
          }
        })
      }
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
