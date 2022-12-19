const main = async () => {
    const [owner, randomPerson] = await hre.ethers.getSigners();
    const contract = await hre.ethers.getContractFactory('CollegeGrades');
    const deployedContract = await contract.deploy();
    await deployedContract.deployed();
    console.log('Contract deployed at: ', deployedContract.address);
    const newStudent = {
        name: 'Jaylan Doe',
        age: 25,
        wallet: owner.address
      };

    await deployedContract.addStudent('Jaylan Doe', 25, owner.address)
    // await deployedContract.getStudentWallets(0);
    console.log(await deployedContract.getStudentWallets());
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