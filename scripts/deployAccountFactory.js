const hre = require('hardhat');

async function main() {
    const accountFactory = await hre.ethers.deployContract('AccountFactory');

    await accountFactory.waitForDeployment();

    console.log(`AccountFactory deployed to ${accountFactory.target}`);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
