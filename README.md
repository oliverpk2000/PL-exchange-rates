# PL-exchange-rates
![Static Badge](https://img.shields.io/badge/License-MIT-green)
![Static Badge](https://img.shields.io/badge/Language-Perl-purple)

PL-exchange-rates is a perl script that scrapes a currency-exchange website (https://www.x-rates.com/table/?from=EUR&amount=1) and saves the data as a csv.

## Installation

**notice: this install guide assumes you have a Linux System with Perl 5.38 installed**

Clone/download the project in your preferred way. 

Change directory to this project and run dependencies.sh from your terminal


```bash
bash dependencies.sh
```

This will install all necessary perl libraries using the CPAN package manager. If you have never configured CPAN, the automated setup wizard will run.

## Usage

Once installed, run this command from the project root to execute the script:

```bash
perl bin/scraper.pl
```

This will run the script. On first run, the script will create the `/data` directory and and the `data.csv` file in it. On any other execution it will append to this file.

## Roadmap

- some rows are saved twice, remove this redundancy
- cmd option to only save one currency

## Contributing

Just fork and send me a pull request, if there are changes necessary I'll request them. 

## Author and acknowledgement

### Author
just me, @oliverpk2000

### acknowledgement

this tutorial was very helpful for the actual webscraping, highly recommend: https://www.zenrows.com/blog/perl-web-scraping

## License

MIT, copyright 2024

## Project status and thoughts

Perl is not a programming language fit for the 2020's and beyond. Unless a fit of productivity hits me, I will not work on this project anymore. If you have any improvements just fork and pr.