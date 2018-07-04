require('../css/common.less');

<card>
	<div if={ !opts.card.hide } class="card">
		<div class="header">
			{ opts.card.number }
		</div>
		<div class="contents">
			{ opts.card.number }
		</div>
		<div class="footer">
			{ opts.card.number }
		</div>
	</div>
	<div if={ opts.card.hide } class="card back-side"></div>

	<style type="less">
		:scope {
			position: absolute;
			display: block;
			left: -1px;
			top: -1px;
			width: 100px;
			height: 150px;
			border-color: 1px solid black;
		}
		.card {
			width: 100%;
			height: 100%;
			border: 2px solid blue;

			&.back-side {
				background-color: gray;
			}

			.header, .footer {
				height: 20px;
			}

			.footer {
				transition: rotate(180deg);
			}
		}
	</style>
</card>
