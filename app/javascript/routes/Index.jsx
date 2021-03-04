import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Home from "../components/Home";
import Foods from "../components/Foods";
import Food from "../components/Food";

export default (
  <Router>
    <Switch>
      <Route path="/" exact component={Home} />
      <Route path="/foods" exact component={Foods} />
      <Route path="/food/:id" exact component={Food} />
    </Switch>
  </Router>
);
