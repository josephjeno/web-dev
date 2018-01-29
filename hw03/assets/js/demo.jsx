import React from 'react';
import ReactDOM from 'react-dom';
import { Button } from 'reactstrap';

export default function run_demo(root) {
  ReactDOM.render(<Demo side={0}/>, root);
}

// state
//	letterArray: random array of pairs of letters between A - H
//	lettersSelected: the letters currently displayed
//	squaresSelected: the squares currently displayed
//	clicks:	the number of clicks thus far
//	numberFlipped: the number of successful pairs thus far
//	boxFlipped: array of booleans, returns true if box is flipped
//	boxMatched: array of booleans, returns true if box is matched


class Demo extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
	 letterArray: this.shuffleLetters(),
	 lettersSelected: [],
         squaresSelected: [],
         clicks: 0,
	 numberFlipped: 0,
         boxFlipped: [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
	 boxMatched: [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
	};
  }

  restart() {
     this.setState({
	letterArray: this.shuffleLetters(),
	lettersSelected: [],
	squaresSelected: [],
	clicks: 0,
	numberFlipped: 0,
        boxFlipped: [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
	boxMatched: [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
	})
   }
	
  shuffleLetters() {
    let arrayL = ['A','A','B','B','C','C','D','D','E','E','F','F','G','G','H','H'];
    arrayL = _.shuffle(arrayL);
    return arrayL;
  }

  isGameOver() {
    return this.state.numberFlipped == 16;
  }

  flipCard(square, letter) {
    this.state.lettersSelected.push(letter);
    this.state.squaresSelected.push(square);
    this.state.boxFlipped[square] = true;
    this.state.clicks = (this.state.clicks + 1);
  }

  isMatched() {
    return this.state.lettersSelected[0] == this.state.lettersSelected[1];
  }

  matchSquares() {
    var boxOne = this.state.squaresSelected[0];
    var boxTwo = this.state.squaresSelected[1];
    this.state.boxMatched[boxOne] = true;
    this.state.boxMatched[boxTwo] = true;
    this.state.numberFlipped += 2;
    this.state.lettersSelected = [];
    this.state.squaresSelected = [];
    this.setState(this.state);
  }

  unMatchSquare() {
    var boxOne = this.state.squaresSelected[0];
    var boxTwo = this.state.squaresSelected[1];
    this.state.boxFlipped[boxOne] = false;
    this.state.boxFlipped[boxTwo] = false;
    this.state.lettersSelected = [];
    this.state.squaresSelected = [];
    this.setState(this.state);
  }

  onClick(i) {

    if (this.state.lettersSelected.length == 0) {
	this.flipCard(i, this.state.letterArray[i]);
    } else if (this.state.lettersSelected.length == 1) {
	this.flipCard(i, this.state.letterArray[i]);
    }
    if (this.state.lettersSelected.length == 2) {
	if (this.isMatched()) {
	    setTimeout(this.matchSquares.bind(this), 1000);
	} else {
	    setTimeout(this.unMatchSquare.bind(this), 1000);
	}
    }
   
    if (this.isGameOver()) {
    }
    
    this.setState(this.state);
  }

  render() {
   var letterArray = this.state.letterArray;
    return (
    <div class="container">
      <div class="row">
	<div class="col-sm">
	<Restart root={this} onClick={this.restart.bind(this)}/>
	</div>
	<div class="col-sm">
	<Score root={this} />
	</div>
      </div>
      <div class="row">
        <div class="col-sm"> 
        <Square id="box01" show={this.state.boxFlipped[0]}  match={this.state.boxMatched[0]}  letter={this.state.letterArray[0]} onClick={this.onClick.bind(this, 0)} />
        </div>
        <div class="col-sm">
        <Square id="box02" show={this.state.boxFlipped[1]}  match={this.state.boxMatched[1]}  letter={this.state.letterArray[1]} onClick={this.onClick.bind(this, 1)} />
        </div>
        <div class="col-sm">
        <Square id="box03" show={this.state.boxFlipped[2]}  match={this.state.boxMatched[2]}  letter={this.state.letterArray[2]} onClick={this.onClick.bind(this, 2)} />
        </div>
        <div class="col-sm">
        <Square id="box04" show={this.state.boxFlipped[3]}  match={this.state.boxMatched[3]}  letter={this.state.letterArray[3]} onClick={this.onClick.bind(this, 3)} />
        </div>
      </div>
      <div class="row">
	<div class="col-sm">
        <Square id="box05" show={this.state.boxFlipped[4]}  match={this.state.boxMatched[4]}  letter={this.state.letterArray[4]} onClick={this.onClick.bind(this, 4)} />
	</div>
	<div class="col-sm">
        <Square id="box06" show={this.state.boxFlipped[5]}  match={this.state.boxMatched[5]}  letter={this.state.letterArray[5]} onClick={this.onClick.bind(this, 5)} />
	</div>
	<div class="col-sm">
        <Square id="box07" show={this.state.boxFlipped[6]}  match={this.state.boxMatched[6]}  letter={this.state.letterArray[6]} onClick={this.onClick.bind(this, 6)} />
	</div>
	<div class="col-sm">
        <Square id="box08" show={this.state.boxFlipped[7]}  match={this.state.boxMatched[7]}  letter={this.state.letterArray[7]} onClick={this.onClick.bind(this, 7)} />
	</div>
      </div> 
      <div class="row">
	<div class="col-sm">
        <Square id="box09" show={this.state.boxFlipped[8]}  match={this.state.boxMatched[8]}  letter={this.state.letterArray[8]} onClick={this.onClick.bind(this, 8)} />
	</div>
	<div class="col-sm">
        <Square id="box10" show={this.state.boxFlipped[9]}  match={this.state.boxMatched[9]}  letter={this.state.letterArray[9]} onClick={this.onClick.bind(this, 9)} />
	</div>
	<div class="col-sm">
        <Square id="box11" show={this.state.boxFlipped[10]}  match={this.state.boxMatched[10]}  letter={this.state.letterArray[10]} onClick={this.onClick.bind(this, 10)} />
	</div>
	<div class="col-sm">
        <Square id="box12" show={this.state.boxFlipped[11]}  match={this.state.boxMatched[11]}  letter={this.state.letterArray[11]} onClick={this.onClick.bind(this, 11)} />
	</div>
      </div>
      <div class="row">
	<div class="col-sm">
        <Square id="box13" show={this.state.boxFlipped[12]}  match={this.state.boxMatched[12]}  letter={this.state.letterArray[12]} onClick={this.onClick.bind(this, 12)} />
	</div>
	<div class="col-sm">
        <Square id="box14" show={this.state.boxFlipped[13]}  match={this.state.boxMatched[13]}  letter={this.state.letterArray[13]} onClick={this.onClick.bind(this, 13)} />
	</div>
	<div class="col-sm">
        <Square id="box15" show={this.state.boxFlipped[14]}  match={this.state.boxMatched[14]}  letter={this.state.letterArray[14]} onClick={this.onClick.bind(this, 14)} />
	</div>
	<div class="col-sm">
        <Square id="box16" show={this.state.boxFlipped[15]}  match={this.state.boxMatched[15]}  letter={this.state.letterArray[15]} onClick={this.onClick.bind(this, 15)} />
	</div>
      </div>
    </div>
    );
  }
}

function Restart(params) {
   return (
	<div id="restart">
	  <button type="button" class="btn btn-secondary btn-lg float-right" onClick={params.onClick.bind(this)}> Restart</button>
	</div>
)}

function Score(params) {
   return (
	<div id="score">
	<span> Score: {50 - params.root.state.clicks} </span>
	</div>
)}
	

function Square(params) {
  if (params.match) {
    return (
      <div id="side-0" className="side col">
        &nbsp;
      </div>
    );
  } else if (params.show) {
    return (
      <div id="side-0" className="side col">
        <button type="button" class="btn btn-secondary btn-lg" letter={params.letter} id={params.id} onClick={params.onClick.bind(this)}> {params.letter}     </button>
      </div>
    );
  }
  else {
    return (
      <div id="side-0" className="side col">
        <button type="button" class="btn btn-secondary btn-lg" letter={params.letter} id={params.id} onClick={params.onClick.bind(this)}> -     </button>
      </div>
    );
  }
}

