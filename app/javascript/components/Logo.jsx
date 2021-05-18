import React from "react";
import PropTypes from "prop-types";

const Logo = props => (
  <div className="logo-landing">
    <div className="container secondary-color">
      <header className="logo-heading">
        <h1 className="display-1">Quickery</h1>
        <img id="logo-img" className="img-thumbnail" src="https://i.ibb.co/djXMTRP/kisspng-computer-icons-check-mark-clip-art-5b160ba92bfd76-0021048815281714331802-1.png" alt="checkmark-logo"/>
      </header>
    </div>
    <div id="logo-tagline">
      <p className="lead">
        <span>{props.tagline}</span>
      </p>
    </div>
  </div>
);

Logo.propTypes = {
  tagline: PropTypes.string.isRequired
};

export default Logo; 