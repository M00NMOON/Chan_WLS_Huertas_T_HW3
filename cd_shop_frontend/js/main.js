const app = Vue.createApp({
  created() {
    fetch("http://localhost/Chan_WLS_Huertas_T_HW3/lumen_cd_shop/public/albums")
      .then((response) => response.json())
      .then((data) => {
        //console.log(data);
        this.albumData = data; //fiil the array with the data
        this.loadingAlbum = false;
      })
      .catch((error) => console.error(error));
  },
  data() {
    return {
      albumData: [], //store it in an array
      name: "",
      title: "",
      genre: "",
      release_date: "",
      image: "",
      description: "",
      error: "",
      loadingAlbum: true,
      loading: false,
    };
  },
  methods: {
    getBook(id) {
      this.loading = true;
      console.log(id);
      fetch(
        `http://localhost/Chan_WLS_Huertas_T_HW3/lumen_cd_shop/public/albums/${id}`
      )
        .then((response) => response.json())
        .then((data) => {
          this.loading = false;
          if (data.length > 0) {
            const albumData = data[0];
            this.name = albumData.name ? albumData.name : "Not Available";
            this.title = albumData.title ? albumData.title : "Not Available";
            this.name = albumData.name ? albumData.name : "Not Available";
            this.image = albumData.image_file
              ? albumData.image_file
              : "Not Available";
            this.release_date = albumData.release_date
              ? albumData.release_date
              : "Not Available";
            this.genre = albumData.genre ? albumData.genre : "Not Available";
            this.description = albumData.description
              ? albumData.description
              : "Not Available";
          } else {
            this.error = "No book found with the given query";
          }
          //const albumData = data[0];
          //console.log(data);
          //   this.albumData = data;
        })
        .then(
          document.doecumentElement.scrollIntoView({
            behavior: "smooth",
            block: "end",
          })
        )
        .catch((error) => console.error(error));
    },
  },
}).mount("#app");
