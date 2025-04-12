export function createApp() {
  const app = Vue.createApp({
    created() {
      fetch(
        "http://localhost/Chan_WLS_Huertas_T_HW3/lumen_cd_shop/public/albums"
      )
        .then((response) => response.json())
        .then((data) => {
          console.log(data);
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
      getAlbum(id) {
        this.loading = true;

        fetch(
          `http://localhost/Chan_WLS_Huertas_T_HW3/lumen_cd_shop/public/albums/${id}`
        )
          .then((response) => response.json())
          .then((data) => {
            this.loading = false;

            if (data.length > 0) {
              const albumData = data[0];
              this.name = albumData.name || "Not Available";
              this.title = albumData.title || "Not Available";
              this.image = albumData.image_file || "Not Available";
              this.release_date = albumData.release_date || "Not Available";
              this.genre = albumData.genre || "Not Available";
              this.description = albumData.description || "Not Available";

              // Highlight the selected <li> item
              const albumItems = document.querySelectorAll("#album-list li");
              albumItems.forEach((item) => item.classList.remove("active"));
              const selectedItem = document.querySelector(
                `#album-list li[data-id="${id}"]`
              );

              if (selectedItem) {
                selectedItem.classList.add("active");
              }

              // // Smooth scroll to the info box
              // this.$nextTick(() => {
              //   gsap.to(window, {
              //     duration: 1,
              //     scrollTo: "#info-box",
              //     ease: "power2.out",
              //   });
              // });
            } else {
              this.error = "No album found with the given query";
            }
          })
          .catch((error) => console.error(error));
      },
    },

    // const albumList = document.querySelector("#album-list");
    // const albumItems = albumList.querySelectorAll("li");
    // const albumInfoBox = document.querySelector("#info-box");
    // const albumInfoBoxContent = albumInfoBox.querySelector("#album-info");

    // albumList.appendChild(albumItems);

    watch: {
      name(newVal) {
        if (newVal) {
          this.$nextTick(() => {
            // Smooth scroll to the info box
            gsap.to(window, {
              duration: 1,
              scrollTo: { y: "#info-box", offsetY: 0 },
              ease: "power2.out",
            });

            // Animate the info box
            gsap.from("#info-box", {
              opacity: 0,
              y: 50,
              duration: 1,
              ease: "power2.out",
            });
          });
        }
      },
    },
  });
  app.mount("#app");
}
