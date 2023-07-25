#College Grades/Courses

This is a solidity contrat that allows you to add and track student grades, courses, and GPA

It is currently deployed to the goerlie network and uses test ETH to add students and courses info. So make sure that your wallet supports it!

UI lives at: [https://github.com/jaysnel/college-grades-ui](https://github.com/jaysnel/college-grades-ui)

Once script is pulled down run the following command to install all dependencies:
```
yarn install
```

To deploy:
```
npx hardhat run scripts/deploy.js --network networkOfChoice
```
Make sure to update the hardhat config with the same network of your choice

You will need these environment variables to run the contract successfully:
```
ALCHEMY_APP_API_URL
METAMASK_PRIVATE_KEY
```

I used Alchemy for this and metamask but please use whatver you see fit and make sure to update the value names if you so choose.

There are 2 scripts: deploy.js and run.js.
deploy is the main script used to actually deploy to a specific network.
run is used to test different functions prior to deployment.

List of functions include:
```
checkIfWalletExists()
addStudent()
addCourse()
getGPA()
getTotalStudentCount()
getStudentData()
```
