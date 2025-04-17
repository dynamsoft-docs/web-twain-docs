---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Development - React Integration
keywords: Dynamic Web TWAIN, Documentation, Development, React Integration
breadcrumbText: React Integration
description: Dynamic Web TWAIN SDK Documentation React Integration Page
---

# Use Web TWAIN in React

[React](https://reactjs.org/) is a JavaScript library meant explicitly for creating interactive UIs. Follow this guide to learn how to implement `DWT` in a React application.

## Preparation

Make sure you have [node](https://nodejs.org/) installed. `node 20.18.2` is used in the example below.

## Create the Sample Project

### Create a React project using Vite:

``` cmd
npm create vite@latest dwt-react --template react
```

After running this, you will need to select the following options:
- Select a framework: React
- Select a variant: JavaScript

### Navigate to the project folder:

``` cmd
cd dwt-react
```

### Install dependencies and the required packages for DWT and NCP:

``` cmd
npm install
```

``` cmd
npm install dwt ncp
```

> `ncp` is used to copy static resources files.

## Configure the Project

Open `package.json` and change `scripts` like this:

``` json
"scripts": {
   "copy-resources": "ncp node_modules/dwt/dist public/dwt-resources",
    "dev": "npm run copy-resources && vite",
    "build": "npm run copy-resources && vite build",
    "lint": "eslint .",
    "preview": "vite preview"
},
```

> Note: The change ensures the static files required to run `DWT` are copied over to the built project.

We can get these resource files in a few different ways. See our [resource loading guide](/_articles/general-usage/resource-loading.md) to see how to load resource files from our official SDK, CDNs, or package managers.

## Implementation

### Generate a Component

Under `/src/`, create a new JavaScript file and name it `dwt.jsx`.

### Edit the Component

* Copy the following to the newly created `dwt.jsx`.

``` typescript
import React, { useEffect, useRef } from 'react';
import Dynamsoft from 'dwt';

function DWT() {
    const containerId = 'dwtcontrolContainer';
    const dwtObject = useRef(null);

    useEffect(() => {
        Dynamsoft.DWT.RegisterEvent('OnWebTwainReady', () => {
            dwtObject.current = Dynamsoft.DWT.GetWebTwain(containerId);
        });
        
        Dynamsoft.DWT.ProductKey = 'YOUR-PRODUCT-KEY';
        Dynamsoft.DWT.ResourcesPath = "/dwt-resources";
        Dynamsoft.DWT.Containers = [{
            WebTwainId: 'dwtObject',
            ContainerId: containerId,
            Width: '300px',
            Height: '400px'
        }];
        
        Dynamsoft.DWT.Load();
    }, []);

    const acquireImage = () => {
        if (dwtObject.current) {
            dwtObject.current.SelectSourceAsync()
            .then(() => dwtObject.current.AcquireImageAsync({
                IfCloseSourceAfterAcquire: true,
            }))
            .catch((error) => {
                console.error(error.message);
            });
        }
    };

    return (
        <>
            <button onClick={acquireImage}>Scan</button>
            <div id={containerId}></div>
        </>
    );
};

export default DWT;
```

> Note:
> * `containerId` specifies the DIV to create `DWT` viewer in which is defined in the `template`.
> * `OnWebTwainReady` is the callback triggered when the initialization succeeds.
> * `ProductKey` must be set to a valid trial or full key.
> * `ResourcesPath` points to the location of the static files mentioned in [Configure the project](#configure-the-project).

### Add the Component to `App.jsx`

``` javascript
import React from 'react';
import './App.css';
import DWT from './dwt';

function App() {
    return <DWT />;
}

export default App;
```

### remove default styles
Clear the contents of the src/App.css and src/index.css files.

### Run the Application

``` cmd
npm run dev
```

> Note: If you have installed `DWT` and have configured a valid `ProductKey`, you will have a working page to scan documents from your scanner now. Otherwise, you should see instructions on the page that guide you to install the library. [More info>>](/_articles/general-usage/initialization.md#installation-of-the-dynamsoft-service)

## Official Samples

Check out the following sample project:

* [dwt-react-advanced](https://github.com/Dynamsoft/web-twain-react-advanced)
