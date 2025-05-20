---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Development - Angular Integration
keywords: Dynamic Web TWAIN, Documentation, Development, Angular Integration
breadcrumbText: Angular Integration
description: Dynamic Web TWAIN SDK Documentation Angular Integration Page
---

# Use Web TWAIN in Angular

[Angular](https://angular.io/) is one of the most popular and mature JavaScript frameworks. Check out the following on how to implement `Dynamic Web TWAIN` into an Angular application.

![](https://www.dynamsoft.com/web-twain/docs/assets/imgs/download.png) [Sample of dwt-angular-advanced](https://github.com/dynamsoft-dwt/dwt-angular-advanced)

## Preparation

Make sure you have [node](https://nodejs.org/) and [Angular CLI](https://cli.angular.io/) installed. `node 22.14.0` and `Angular CLI 19.1.7` are used in the example below.

## Create the sample project

### Create an out-of-the-box raw Angular application

``` cmd
ng new dwt-angular
```

### **cd** to the root directory of the application and install the dependencies

``` cmd
npm install dwt@19.1.0
```

## Configure the project

Open `angular.json` and add the following lines to `"build"/"options"/"assets"` .

> These lines will copy the static files necessary to run `Dynamic Web TWAIN` to the resulting project.

``` json
{
    "glob": "**/*",
    "input": "./node_modules/dwt/dist",
    "output": "assets/dwt-resources"
}
```

We can get these resource files in a few different ways. See our [resource loading guide](/_articles/general-usage/resource-loading.md) to see how to load resource files from our official SDK, CDNs, or package managers.

## Start to implement

### Generate a component

``` cmd
ng generate component dwt
```

### Edit the component

* In `dwt.component.html` add a button and a `HTMLDIVElement` .

``` html
<button (click)="acquireImage()">Acquire Images</button>
<div id="dwtcontrolContainer"></div>
```

* In `dwt.component.ts` add code to initialize `Dynamic Web TWAIN` .

``` typescript
import Dynamsoft from 'dwt';
```

``` typescript
containerId = "dwtcontrolContainer";
ngOnInit(): void {
    Dynamsoft.DWT.Containers = [{
        WebTwainId: 'dwtObject',
        ContainerId: this.containerId,
        Width: '300px',
        Height: '400px'
    }];
    Dynamsoft.DWT.RegisterEvent('OnWebTwainReady', () => {
        this.Dynamsoft_OnReady();
    });
    Dynamsoft.DWT.ProductKey = 'YOUR-PRODUCT-KEY';
    Dynamsoft.DWT.ResourcesPath = 'assets/dwt-resources';
    Dynamsoft.DWT.Load();
}
```

> Note:
> * `containerId` specifies the `HTMLDIVElement` to create `Dynamic Web TWAIN` viewer in.
> * `OnWebTwainReady` is the callback triggered when the initialization succeeds.
> * `ProductKey` must be set to a valid trial or full key.
> * `ResourcesPath` is set to the location of the static files mentioned in [Configure the project](#configure-the-project).

* Get a handler of the `WebTwain` instance.

Use the method [ `Dynamsoft.DWT.GetWebTwain()` ](/_articles/info/api/Dynamsoft_WebTwainEnv.md#getwebtwain) to get a handler of the created `WebTwain` instance.

``` typescript
import { WebTwain } from 'dwt/dist/types/WebTwain';
```

``` typescript
DWTObject: WebTwain | any = null;
Dynamsoft_OnReady() {
    this.DWTObject = Dynamsoft.DWT.GetWebTwain(this.containerId);
}
```

* Define the function `acquireImage()` .

``` typescript
acquireImage() {
    if (this.DWTObject) {
        this.DWTObject.SelectSourceAsync()
        .then(() => {
            return this.DWTObject.AcquireImageAsync({
                IfCloseSourceAfterAcquire: true,
            });
        })
        .catch((exp:any) => {
            console.error(exp.message);
        });
    }
}
```

* Add the component to `app.component.html` .

Edit the file `app.component.html` to contain nothing but the following

``` html
<app-dwt></app-dwt>
```

* Add the component to `app.component.ts` .

``` typescript
import { DwtComponent } from "./dwt/dwt.component";
```

``` typescript
imports: [RouterOutlet, DwtComponent],
```

### Review the Complete Code

* `dwt.component.html`

``` html
<button (click)="acquireImage()">Acquire Images</button>
<div id="dwtcontrolContainer"></div>
```

*  `dwt.component.ts`

``` typescript
import { Component } from '@angular/core';
import Dynamsoft from 'dwt';
import { WebTwain } from 'dwt/dist/types/WebTwain';

@Component({
  selector: 'app-dwt',
  imports: [],
  templateUrl: './dwt.component.html',
  styleUrl: './dwt.component.css'
})
export class DwtComponent {
  containerId = "dwtcontrolContainer";
  ngOnInit(): void {
    Dynamsoft.DWT.Containers = [{
      WebTwainId: 'dwtObject',
      ContainerId: this.containerId,
      Width: '300px',
      Height: '400px'
    }];
    Dynamsoft.DWT.RegisterEvent('OnWebTwainReady', () => {
      this.Dynamsoft_OnReady();
    });
    Dynamsoft.DWT.ProductKey = 'YOUR-PRODUCT-KEY';
    Dynamsoft.DWT.ResourcesPath = 'assets/dwt-resources';
    Dynamsoft.DWT.Load();
  }

  DWTObject: WebTwain | any = null;
  Dynamsoft_OnReady() {
    this.DWTObject = Dynamsoft.DWT.GetWebTwain(this.containerId);
  }
  acquireImage() {
    if (this.DWTObject) {
      this.DWTObject.SelectSourceAsync()
        .then(() => {
          return this.DWTObject.AcquireImageAsync({
            IfCloseSourceAfterAcquire: true,
          });
        })
        .catch((exp: any) => {
          console.error(exp.message);
        });
    }
  }
}
```
> Note:
> * `ProductKey` must be set to a valid trial or full key.

*  `app.component.html` 

``` html
<style></style>
<app-dwt></app-dwt>
<router-outlet />
```

*  `app.component.ts` 

``` typescript
import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { DwtComponent } from "./dwt/dwt.component";

@Component({
  selector: 'app-root',
  imports: [RouterOutlet, DwtComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'dwt-angular';
}
```

## Try running the project.

``` cmd
ng serve -o
```

> If you have installed `Dynamic Web TWAIN` and have configured a valid `ProductKey` . You will have a working page to scan documents from your scanner now. Otherwise, you should see instructions on the page that guide you to install the library. [More info>>](/_articles/general-usage/initialization.md#installation-of-the-dynamsoft-service).

## Official Sample

Check out the following sample project:

* [dwt-angular-advanced](https://github.com/dynamsoft-dwt/dwt-angular-advanced)
