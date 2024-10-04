---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Development - Vue 3 Integration
keywords: Dynamic Web TWAIN, Documentation, Development, Vue3 Integration
breadcrumbText: Vue 3 Integration
description: Dynamic Web TWAIN SDK Documentation Vue 3 Integration Page
permalink: /indepth/development/vue3.html
---

# Use Web TWAIN in Vue 3

[Vue](https://vuejs.org/) is a progressive framework for building user interfaces. Check out the following guide on how to integrate `DWT` into a Vue application.

## Preparation

The recommended version for Vue and Node is `v3.2.22` and `v16+` respectively.

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

If you have installed `DWT` and have configured a valid `ProductKey`, you should now have a working page to scan documents from your scanner. If not, please refer to [this page]({{site.indepth}}features/initialize.html#installation-of-the-dynamsoft-service) which explains how the library is initialized or contact us for further assistance.

#### On mobile

For Android, the scanners that support eSCL can be used.

## Official Samples

Check out the following sample project:

* [dwt-vue](https://github.com/Dynamsoft/web-twain-vue-advanced)