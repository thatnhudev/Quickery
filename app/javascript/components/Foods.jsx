import React from "react";
import { Link } from "react-router-dom";

class Foods extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      foods: []
    };
  }

  componentDidMount() {
    const url = "/api/v1/foods/index";
    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => this.setState({ foods: response }))
      .catch(() => this.props.history.push("/"));
  }

  render() {
    const { foods } = this.state;
    const allFoods = foods.map((food, index) => (
      <div key={index} className="col-md-6 col-lg-4">
        <div className="card mb-4">
          <img
            src={food.image}
            className="card-img-top"
            alt={`${food.name} image`}
          />
          <div className="card-body">
            <h5 className="card-title">{food.name}</h5>
            <Link to={`/food/${food.id}`} className="btn custom-button">
              View Food
            </Link>
          </div>
        </div>
      </div>
    ));
    const noFood = (
      <div className="vw-100 vh-50 d-flex align-items-center justify-content-center">
        <h4>
          No grocery lists yet. Why not <Link to="/new_list">create one</Link>
        </h4>
      </div>
    );

    return (
      <>
        <section className="jumbotron jumbotron-fluid text-center">
          <div className="container py-5">
            <h1 className="display-4">Popular grocery items</h1>
            <p className="lead text-muted">
              We’ve pulled together our most popular grocery items, our latest
              additions, and our editor’s picks, so there’s sure to be something
              tempting for you to try.
            </p>
          </div>
        </section>
        <div className="py-5">
          <main className="container">
            <div className="text-right mb-3">
              <Link to="/food" className="btn custom-button">
                Create New List
              </Link>
            </div>
            <div className="row">
              {foods.length > 0 ? allFoods : noFood}
            </div>
            <Link to="/" className="btn btn-link">
              Home
            </Link>
          </main>
        </div>
      </>
    );
  }
}
export default Foods;
