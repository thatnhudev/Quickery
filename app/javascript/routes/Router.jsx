import React from "react";
import { BrowserRouter, Route, Switch } from "react-router-dom";
import App from "../components/App";
import Food from "../components/Food";
import Foods from "../components/Foods";

const Router = () => (
  <BrowserRouter>
    <Switch>
      <Route exact path="/" component={App} />
      <Route path="/foods" component={Foods} />
      <Route path="/food/:id" component={Food} />
    </Switch>
  </BrowserRouter>
);

export default Router;
