require('../css/common.less');

<card>
	<div class="card { back-side: opts.card.hide }">
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

	<style type="less">
		:scope {
			display: block;
			width: 100px;
			height: 200px;
			border-color: 1px solid black;
		}
		.card {
			border: 2px solid white;

			&.back-side {
				background-color: gray;

				* {
					display: none;
				}
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
