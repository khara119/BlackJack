require('../css/common.less');
require('./card.tag');
const utils = require('../js/utils.js');

<stage>
	<div class="dealer-area">
		<div class="open-area">
		</div>
		<div class="deck-area">
			<virtual each={ card, idx in cards }>
				<card card={ card }></card>
			</virtual>
		</div>
	</div>
	<div class="player-area">
		<div each={ player, idx in players } class="player">
			<div class="bet"></div>
			<div class="open-area">
				<card each={ card, idx in player.cards }
					<card card={ card }></car>
			</div>
			<div class="name"></div>
			<div class="tip"></div>
			<div class="balance"></div>
		</div>
	</div>

	<style type="less">
		:scope {
			display: block;
			width: 100%;
			min-width: 600px;
			height: 100%;
			background-color: forestgreen;
		}
		.dealer-area {
			display: flex;
			justify-content: center;
			align-items: center;
			width: 100%;
			height: 50%;
			padding: 20px;

			.deck-area {
				position: relative;
				display: inline-block;
				width: 100px;
				height: 150px;
				margin: 30px;
				border: 1px solid white;
			}
		}
		.player-area {
			display: flex;
			justify-content: center;
			align-items: center;
			width: 100%;
			height: 50%;
			padding: 20px;

			.player {
				display: inline-block;
				width: 20%;
				height: 50%;
			}
		}
		.open-area {
			display: inline-block;
			width: 100px + (20px * 10);
			height: 150px;
			margin: 30px;
			border: 1px solid white;
		}
	</style>

	this.mixin(utils);

	this.cards = [];
	this.suits = ['S', 'H', 'D', 'C'];
	this.players = [];

	this.on('mount', () => {
		for (let suit in this.suits) {
			for (let i=1; i<=13; i++) {
				this.cards.push({
					number: i,
					suit: suit,
					hide: true,
				});
			}
		}

		for (let i=0; i<5; i++) {
			this.joinPlayer();
		}

		this.update();
	});

	this.shuffle = () => {
		for (let i = this.cards.length -1; i >= 0; i--) {
			const rand = this.randomInt(0, i);
			[this.cards[i], this.cards[rand]] =
				[this.cards[rand], this.cards[i]];
		}
	};

	this.joinPlayer = () => {
		this.players.push({
			name: this.generateName(),
			bet: 0,
			tip: Math.floor(Math.random() * (100000 + 1 - 1000)) + 1000,
		});
	};

</stage>
