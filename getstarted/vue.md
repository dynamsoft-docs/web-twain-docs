---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Development - Vue Integration
keywords: Dynamic Web TWAIN, Documentation, Development, Vue Integration
breadcrumbText: Vue Integration
description: Dynamic Web TWAIN SDK Documentation Vue Integration Page
permalink: /indepth/development/vue.html
---

# Use Web TWAIN in Vue

[Vue](https://vuejs.org/) is a progressive framework for building user interfaces. Check out the following guide on how to integrate `DWT` into a Vue application.

<div class="multi-panel-switching-prefix"></div>

- [Vue](#vue)
- [Vue 3](#vue3)

<div class="multi-panel-start"></div>

## Preparation

Make sure you have [node](https://nodejs.org/), [yarn](https://yarnpkg.com/cli/install), and [Vue CLI](https://cli.vuejs.org/) installed. `node 14.4.0` , `yarn 1.22.4`, and `@vue/cli 4.46` are used in the example below.

## Create the sample project

### Create a bootstrapped raw Vue application

``` cmd
vue create dwt-vue
```

### Navigate to the root directory of the application and install the `dwt` and `ncp` package

``` cmd
yarn add dwt
```

``` cmd
yarn add ncp
```

> `ncp` is used to copy static resources files.

## Configure the project

Open `package.json` and change `scripts` as seen below:

``` json
"scripts": {
    "serve": "ncp node_modules/dwt/dist public/dwt-resources && vue-cli-service serve",
    "build": "vue-cli-service build&& ncp node_modules/dwt/dist build/dwt-resources",
    "lint": "vue-cli-service lint"
},
```

> The change ensures the static files required to run `DWT` are copied over to the resulting built project.

We can get these resource files in a few different ways. See our [resource loading guide]({{site.general-usage}}resource-loading.html) to see how to load resource files from our official SDK, CDNs, or package managers.

## Start to implement

### Edit the default component

Change the file `/src/components/HelloWorld.vue` to match the following `template` and `script` (keep the `style` as is)

``` html
<template>
  <div class="hello">
    <h1></h1>
    <select id="sources" v-model="selectedIndex">
      <option
        v-for="(source, index) in sourceList"
        v-bind:value="index"
        :key="index"
      >
        {% raw %}{{ source.displayName }}{% endraw %}
      </option>
    </select>
    <button @click="acquireImage()">Acquire Images</button>
    <button @click="openImage()">Open Documents</button>
    <br />
    <br />
    <div v-bind:id="containerId"></div>
  </div>
</template>
<script>
import Dynamsoft from "dwt";
export default {
  name: "HelloWorld",
  props: {
    msg: String,
  },
  data() {
    return {
      containerId: "dwtcontrolContainer",
      sourceList: [],
      selectedIndex: 0,
    };
  },
  mounted() {
    /**
     * ResourcesPath & ProductKey must be set in order to use the library!
     */
    Dynamsoft.DWT.ResourcesPath = "/dwt-resources";
    Dynamsoft.DWT.ProductKey = "YOUR-PRODUCT-KEY";
    Dynamsoft.DWT.Containers = [
      {
        WebTwainId: "dwtObject",
        ContainerId: this.containerId,
        Width: "100%",
        Height: "400px",
      },
    ];
    Dynamsoft.DWT.RegisterEvent("OnWebTwainReady", () => {
      this.Dynamsoft_OnReady();
    });
    Dynamsoft.DWT.Load();
  },
  methods: {
    /**
     * Dynamsoft_OnReady is called when a WebTwain instance is ready to use.
     * In this callback we do some initialization.
     */
    Dynamsoft_OnReady() {
      this.DWTObject = Dynamsoft.DWT.GetWebTwain(this.containerId);
      this.DWTObject.GetDevicesAsync()
        .then((deviceList) => {
          this.sourceList = deviceList;
        })
        .catch((e) => {
          console.error(e);
        });
    },
    /**
     * Acquire images from scanners or cameras or local files
     */
    acquireImage() {
      if (!this.DWTObject) {
        alert("dwt init fail");
        return;
      }
 
        this.DWTObject.SelectDeviceAsync(this.sourceList[this.selectedIndex])
          .then(() => {
            return this.DWTObject.AcquireImageAsync({
                IfCloseSourceAfterAcquire: true 
            });
          })
          .catch((e) => {
            console.error(e);
          });
    },
    /**
     * Open local images.
     */
    openImage() {
      if (!this.DWTObject) {
        alert("dwt init fail");
        return;
      }
      this.DWTObject.IfShowFileDialog = true;
      /**
       * Note:
       * This following line of code uses the PDF Rasterizer which is an extra add-on that is licensed seperately
       */
      this.DWTObject.Addon.PDF.SetConvertMode(
        Dynamsoft.DWT.EnumDWT_ConvertMode.CM_RENDERALL
      );
      this.DWTObject.LoadImageEx(
        "",
        Dynamsoft.DWT.EnumDWT_ImageType.IT_ALL,
        () => {
          //success
        },
        () => {
          //failure
        }
      );
    },
  },
};
</script>
```

> Note:
> * `containerId` specifies the DIV to create `DWT` viewer, which is defined in the `template`.
> * `OnWebTwainReady` is the callback triggered when `DWT` initialization succeeds.
> * `ProductKey` must be set to a valid trial or full key.
> * `ResourcesPath` is set to the location of the static files mentioned in [Configure the project](#configure-the-project).

### Try running the project

``` cmd
yarn serve
```

#### On desktop

If you have installed `DWT` and have configured a valid `ProductKey` . You will have a working page to scan documents from your scanner now. Otherwise, you should see instructions on [this page]({{site.indepth}}features/initialize.html#installation-of-the-dynamsoft-service) that guides you on installing the library.

#### On mobile

You should be able to open a file or capture an image.

<div class="multi-panel-end"></div>

<div class="multi-panel-start"></div>

## Preparation

The recommended versions for Vue and Node are `v3.2.22` and `v16+` respectively.

## Create the sample project

### Create a bootstrapped raw Vue 3 application

Assume the project name is "dwt-vue3"

``` cmd
npm init vue@latest
```

### Navigate to the root directory of the application and install the `dwt` and `ncp` package

``` cmd
cd dwt-vue3
```

``` cmd
npm install
```

``` cmd
npm install dwt
```

``` cmd
npm install ncp
```

## Configure the project

Open `package.json` and change `scripts` as seen below:

``` json
"scripts": {
    "dev": "ncp node_modules/dwt/dist public/dwt-resources && vite",
    "build": "ncp node_modules/dwt/dist public/dwt-resources && vite build",
    "preview": "vite preview"
},
```

> The change ensures the static files required to run `DWT` are copied over to the resulting built project.

We can get these resource files in a few different ways. See our [resource loading guide]({{site.general-usage}}resource-loading.html) to see how to load resource files from our official SDK, CDNs, or package managers.

## Start to implement

### Edit the default component

Create `localScan.vue` in the folder /src/components

```html
<script setup>
import Dynamsoft from "dwt";
import { onMounted, onUnmounted, ref } from "vue";
let selectedIndex = ref(0);
let sourceList=ref([]);
let DWTObject;
const containerId = "dwtcontrolContainer";
onMounted(() => {
  /**
   * ResourcesPath & ProductKey must be set in order to use the library!
   */
  Dynamsoft.DWT.AutoLoad = false;
  Dynamsoft.DWT.ResourcesPath = "/dwt-resources";
  Dynamsoft.DWT.ProductKey ="YOUR-PRODUCT-KEY";
  Dynamsoft.DWT.Containers = [
    {
      WebTwainId: "dwtObject",
      ContainerId: containerId,
      Width: "500px",
      Height: "600px",
    },
  ];
  Dynamsoft.DWT.RegisterEvent("OnWebTwainReady", () => {
    Dynamsoft_OnReady();
  });
  Dynamsoft.DWT.Load();
});
onUnmounted(()=>{
    Dynamsoft.DWT.Unload();
})
function Dynamsoft_OnReady() {
  DWTObject = Dynamsoft.DWT.GetWebTwain(containerId);
  DWTObject.GetDevicesAsync()
    .then((deviceList) => {
      sourceList.value = deviceList;
    })
    .catch((e) => {
      console.error(e);
    });
}
/**
 * Acquire images from scanners
 */
function acquireImage() {
    DWTObject.SelectDeviceAsync(sourceList.value[selectedIndex.value])
      .then(() => {
        return DWTObject.AcquireImageAsync({IfCloseSourceAfterAcquire:true});
      })
      .catch((e) => {
        console.error(e);
      })
}

/**
 * Open local images.
 */
function openImage() {
  DWTObject.IfShowFileDialog = true;
  /**
   * Note:
   * This following line of code uses the PDF Rasterizer which is an extra add-on that is licensed seperately
   */
  DWTObject.Addon.PDF.SetConvertMode(Dynamsoft.DWT.EnumDWT_ConvertMode.CM_RENDERALL);
  DWTObject.LoadImageEx(
    "",
    Dynamsoft.DWT.EnumDWT_ImageType.IT_ALL,
    () => {
      //success
    },
    () => {
      //failure
    }
  );
}
</script>

<template>
  <div>
    <select v-model="selectedIndex">
      <option
        v-for="(source, index) in sourceList"
        :value="index"
        :key="index"
      >
        {% raw %}{{ source.displayName }}{% endraw %}
      </option>
    </select>
    <button @click="acquireImage()">Acquire Images</button>
    <button @click="openImage()">Open Documents</button>
    <div :id="containerId"></div>
  </div>
</template>

<style scoped></style>
```

> Note:
> * `containerId` specifies the DIV to create `DWT` viewer, which is defined in the `template`.
> * `OnWebTwainReady` is the callback triggered when `DWT` initialization succeeds.
> * `ProductKey` must be set to a valid trial or full key.
> * `ResourcesPath` is set to the location of the static files mentioned in [Configure the project](#configure-the-project).

Change the file /src/App.vue

```html
<script setup>
import HelloWorld from './components/localScan.vue'
</script>

<template>
    <HelloWorld />
</template>

<style scoped>
</style>
```

### Try running the project

``` cmd
npm run dev
```

#### On desktop

If you have installed `DWT` and have configured a valid `ProductKey` . You will have a working page to scan documents from your scanner now. Otherwise, you should see instructions on [this page]({{site.indepth}}features/initialize.html#installation-of-the-dynamsoft-service) that guides you on installing the library.

#### On mobile

For Android, the scanners that support ESCL can be used.

## Official Samples

Check out the following sample project:

* [dwt-vue](https://github.com/Dynamsoft/web-twain-vue-advanced)

<div class="multi-panel-end"></div>

<div class="multi-panel-switching-end"></div>
