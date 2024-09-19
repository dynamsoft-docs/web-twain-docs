---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Development - React Integration
keywords: Dynamic Web TWAIN, Documentation, Development, React Integration
breadcrumbText: React Integration
description: Dynamic Web TWAIN SDK Documentation React Integration Page
permalink: /indepth/development/react.html
---

# Use Web TWAIN in React

[React](https://reactjs.org/) is a JavaScript library meant explicitly for creating interactive UIs. Follow this guide to learn how to implement `DWT` in a React application.

## Preparation

Make sure you have [node](https://nodejs.org/) and [yarn](https://yarnpkg.com/cli/install) installed. `node 14.4.0` and `yarn 1.22.4` are used in the example below.

## Create the Sample Project

### Create a Bootstrapped Raw React Application

``` cmd
npx create-react-app dwt-react
```

### **cd** to the root directory of the application and install the `dwt` and `ncp` package

``` cmd
yarn add dwt
```

``` cmd
yarn add ncp
```

> `ncp` is used to copy static resources files.

## Configure the Project

Open `package.json` and change `scripts` like this:

``` json
"scripts": {
    "start": "ncp node_modules/dwt/dist public/dwt-resources && react-scripts start",
    "build": "react-scripts build && ncp node_modules/dwt/dist build/dwt-resources",
    "test": "ncp node_modules/dwt/dist public/dwt-resources && react-scripts test",
    "eject": "react-scripts eject"
},
```

> Note: The change ensures the static files required to run `DWT` are copied over to the built project.

## Implementation

### Generate a Component

Under `/src/`, create a new JavaScript file and name it `dwt.js`.

### Edit the Component

* Copy the following to the newly created `dwt.js`.

``` typescript
import React from 'react';
import Dynamsoft from 'dwt';

export default class DWT extends React.Component {
    constructor(props) {
        super(props);
    }
    DWTObject = null;
    containerId = 'dwtcontrolContainer';
    componentDidMount() {
        Dynamsoft.DWT.RegisterEvent('OnWebTwainReady', () => {
            this.Dynamsoft_OnReady()
        });
        Dynamsoft.DWT.ProductKey = 'YOUR-PRODUCT-KEY';
        Dynamsoft.DWT.ResourcesPath = "/dwt-resources";
        Dynamsoft.DWT.Containers = [{
            WebTwainId: 'dwtObject',
            ContainerId: this.containerId,
            Width: '300px',
            Height: '400px'
        }];
        Dynamsoft.DWT.Load();
    }
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
            .catch((exp) => {
                console.error(exp.message);
            });
        }
    }
    render() {
        return (<>
            <button onClick = {() => this.acquireImage()} > Scan </button> 
            <div id = {this.containerId}> </div> 
            </>
        );
    }
}
```

> Note:
> * `containerId` specifies the DIV to create `DWT` viewer in which is defined in the `template`.
> * `OnWebTwainReady` is the callback triggered when the initialization succeeds.
> * `ProductKey` must be set to a valid trial or full key.
> * `ResourcesPath` points to the location of the static files mentioned in [Configure the project](#configure-the-project).

### Add the Component to `App.js`

``` javascript
import React from 'react';
import './App.css';
import DWT from './dwt';

function App() {
    return ( < DWT /> );
}

export default App;
```

### Run the Application

``` cmd
yarn start
```

> Note: If you have installed `DWT` and have configured a valid `ProductKey`, you will have a working page to scan documents from your scanner now. Otherwise, you should see instructions on the page that guide you to install the library. [More info>>]({{site.indepth}}features/initialize.html#installation-of-the-dynamsoft-service)

## Official Samples

Check out the following sample project:

* [dwt-react-advanced](https://github.com/Dynamsoft/web-twain-react-advanced)
