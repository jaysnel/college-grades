const main = async () => {
    const contract = await hre.ethers.getContractFactory('CollegeGrades');
    const deployedContract = await contract.deploy();
    await deployedContract.deployed();
    console.log('Contract deployed at: ', deployedContract.address);
} 

const runMain = async () => {
    try {
        await main();
        process.exit(0);
    } catch (err) {
        console.log(err);
        process.exit(1);
    }
}

runMain();