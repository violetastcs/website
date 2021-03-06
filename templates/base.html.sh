#!/usr/bin/env sh

cat << EOF
<!DOCTYPE html>

<html>
	<head>
		<meta charset="utf-8"/>
		<link rel="stylesheet" href="/static/style.css"/>

		<title>$2</title>

		<style>
			body {
				background-image: url("/static/images/$3");
				color: $4;
			}
		</style>
	</head>
	<body>
		<div class="w3-bar w3-black">
		</div>
		<div id="main" class="w3-container">
			$1
		</div>

		<hr/>

		<footer>
			<p>
				<a href="/">Home</a>
				<a href="/serve/pubkey.txt">GPG Key</a>
				<a href="/posts/misc/gpl-3.0.html">License</a>
				<p>Donate:</p>
				<ul>
				<li>Ethereum + Tokens: 0x6ad126B28156cF726337E5DC5993b3BF12AF7CD9 <a href="/serve/eth-qr.png">(QR code)</a>
					<ul>
						<li>I'd appreciate any tokens you'd be willing to donate, especially Dai.</li>
					</ul>
				</li>
				</ul>
			</p>
		</footer>
	</body>
</html>
EOF
