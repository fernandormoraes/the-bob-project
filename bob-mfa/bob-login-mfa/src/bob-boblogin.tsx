import singleSpaReact from "single-spa-react";
import App from "./components/app";
import React from "react";
import ReactDOM from "react-dom";
import './style/index.css'


const preactLifecycles = singleSpaReact({
  React: React,
  ReactDOM: ReactDOM,
  rootComponent: App,
});

export const bootstrap = preactLifecycles.bootstrap;
export const mount = preactLifecycles.mount;
export const unmount = preactLifecycles.unmount;