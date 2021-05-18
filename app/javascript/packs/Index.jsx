import React from "react";
import { render } from "react-dom";
import 'bootstrap/dist/css/bootstrap.min.css';
import Router from "../routes/Router"
import $ from 'jquery';
import Popper from 'popper.js';
import 'bootstrap/dist/js/bootstrap.bundle.min';

document.addEventListener("DOMContentLoaded", () => {
  render(<Router />, document.querySelector("#main"));
});