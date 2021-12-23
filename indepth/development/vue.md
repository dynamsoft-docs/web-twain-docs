---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN Development - Vue Integration
keywords: Dynamic Web TWAIN, Documentation, Development, Vue Integration
breadcrumbText: Vue Integration
description: Dynamic Web TWAIN SDK Documentation Vue Integration Page
---

# Use DWT with Vue

[Vue](https://vuejs.org/) is a progressive framework for building user interfaces. Check out the following guide on how to integrate `DWT` into a Vue application.

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

## Start to implement

### Edit the default component

Change the file `/src/components/HelloWorld.vue` to match the following `template` and `script` (keep the `style` as is)

``` html
<template>
<div class="hello">
    <h1>{{ msg }}</h1>
    <select v-if="!bWASM" id="sources"></select>
    <button v-if="!bWASM" @click="acquireImage()">Acquire Images</button>
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
            containerId: "dwtControlContainer",
            bWASM: false,
        };
    },
    mounted() {
        this.bWASM = false;
        /**
         * ResourcesPath & ProductKey must be set in order to use the library!
         */
        Dynamsoft.DWT.ResourcesPath = "dwt-resources";
	Dynamsoft.WebTwainEnv.ProductKey = 'YOUR-PRODUCT-KEY';
        Dynamsoft.DWT.Containers = [{
            WebTwainId: "dwtObject",
            ContainerId: this.containerId,
            Width: "100%",
            Height: "400px",
        }, ];
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
            this.DWObject = Dynamsoft.DWT.GetWebTwain(this.containerId);
	    this.bWASM = Dynamsoft.Lib.env.bMobile || !Dynamsoft.DWT.UseLocalService;
            if (this.bWASM) {
                this.DWObject.Viewer.cursor = "pointer";
            } else {
                let sources = this.DWObject.GetSourceNames();
                this.selectSources = document.getElementById("sources");
                this.selectSources.options.length = 0;
                for (let i = 0; i < sources.length; i++) {
                    this.selectSources.options.add(new Option(sources[i], i.toString()));
                }
            }
        },
        /**
         * Acquire images from scanners or cameras or local files
         */
        acquireImage() {
            if (!this.DWObject) this.DWObject = Dynamsoft.DWT.GetWebTwain();
            if (this.bWASM) {
                alert("Scanning is not supported under the WASM mode!");
            } else if (
                this.DWObject.SourceCount > 0 &&
                this.DWObject.SelectSourceByIndex(this.selectSources.selectedIndex)
            ) {
                const onAcquireImageSuccess = () => {
                    this.DWObject.CloseSource();
                };
                const onAcquireImageFailure = onAcquireImageSuccess;
                this.DWObject.OpenSource();
                this.DWObject.AcquireImage({},
                    onAcquireImageSuccess,
                    onAcquireImageFailure
                );
            } else {
                alert("No Source Available!");
            }
        },
        /**
         * Open local images.
         */
        openImage() {
            if (!this.DWObject) this.DWObject = Dynamsoft.DWT.GetWebTwain();
            this.DWObject.IfShowFileDialog = true;
            /**
             * Note:
	     * This following line of code uses the PDF Rasterizer which is an extra add-on that is licensed seperately
             */
            this.DWObject.Addon.PDF.SetConvertMode(
                Dynamsoft.DWT.EnumDWT_ConvertMode.CM_RENDERALL
            );
            this.DWObject.LoadImageEx(
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

## Official Samples

Check out the following sample project:

* [dwt-vue-simple](https://github.com/dynamsoft-dwt/dwt-vue-simple)

<!--* [dwt-vue-advanced](https://github.com/dynamsoft-dwt/dwt-vue-advanced)-->
