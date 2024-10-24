const { execSync } = require('child_process');
const path = require('path');

try {
    console.log('Installing dependencies...');
    falcoDir = path.join(process.env.PWD, 'falco');
    process.chdir(falcoDir);
    child = execSync('npm install');
    console.log(child.toString());
    console.log('Dependencies installed successfully.');
} catch (error) {
    console.error(`Failed to install dependencies: ${error.message}`);
    process.exit(1);
}c