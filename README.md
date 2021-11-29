# CertifyEd 

## Helping course creators solve the hurdles for creating trusted education certificates by letting their students mint their certificates on the blockchain.


### Inspiration

In the past year, I've launched 1 online course and helped 3 course creators launch their courses by designing the right strategies, defining their audience, choosing the right platform, and ultimately achieving their goals.

One of the issues I encountered while helping them is that we did not have any way of generating a valid and trusted certification for our students, the current options were too expensive and others put a long application process to access them.

A few months ago I started developing smart contracts with solidity and decided to solve the issue of generating trusted certifications for the students of online courses, letting course creators charge for the certifications, and switching to a model where they give the course for free, but charge for the certifications.

### What it does

CertifyEd lets Course Creators create courses on the site and then let the students mint the certificates from the courses they have taken,  letting course creators charge for the certificates and then setting the final score for each student.

Certificates minted on the blockchain enjoy all the benefits of the technology while allowing students to show their credentials in a simple way and with no chance of tampering with the credential information.

Currently, Certificates can be combined, generating a new certificate that has the information from their parents, so when students complete several courses from the same Course Creators they can combine their Certificates to generate a new more powerful certificate.

CertifyEd takes a 10% commission from the total amount creators pay for handling transactions and sustaining the operations.

### How we built it

First I called the course creators I had helped and asked them about their problems with certification generation. They told me how they weren't using any certifications because they didn't have a simple way of creating trusting certifications rather than just a PDF with a name and a badge. One told me about using a traditional service that generates certificates signed with an SSL certificate, they stopped using the service because it was too expensive and was not solving the issue for them.

With that in mind, I started to create a smart contract that supports the execution of all the functions, deployed on Testnets and currently evaluating which is the right Mainnet to deploy the contract.

Then I focused on the dApp that lets course creators generate a course and then Students mint their certificates, making sure security was a priority, and lastly generated the front end using an already created template.

For the smart contract code, I was inspired by the Dungeons and Dragons Chainlink Labs workshop and other ERC721 smart contracts.

### Challenges we ran into

The biggest challenge was to decide on which blockchain to deploy since Ethereum Mainnet is really expensive and then there are several other options for this, right now I have decided to publish on Polygon Mainnet, but I evaluate other possibilities.

Currently, there is an unsolved challenge in the project, as the current code is written every user of the dApp can mint certificates from a course, so there needs to be a way of only letting approved users mint certificates from specific courses. Perhaps implementing a method in the dApp to let course creators generate an array of approved addresses, and then only letting those specific addresses mint the courses they have completed.

Another challenge I ran into, was that two of the course creators mentioned they did not understand how the blockchain technology worked thus they were not sure if they would like to use this solution. Perhaps the focus should be first on course creators that give blockchain-related content and then migrate to non-blockchain-related content.

### Accomplishments that we're proud of

I'm proud of developing and deploying this project on my own because I learned a ton from blockchain technology, but I definitely need to build a team to make this project successful.

### What we learned

I learned about deploying smart contracts using math libraries that support Fixed point math, since there is no maintained official fixed point math I had to choose an implementation from a DAO that is currently using FixidityLib.

### What's next for CertifyEd

The next step is to start building a community of course creators who're looking to provide trusted certificates to their students, providing them with the tools they need to become successful at their practice, and start creating a repository of content related to course creation and certification generation.

Also, it's interesting to evaluate if it makes sense to create a white label from the solution and offer it to already established academic institutions that want to take this approach, alternatively partnerships or joint ventures with those institutions is also something to evaluate.

The combination of different certificates is intended to mimic the higher education diplomas, so you complete different credit courses and then you get a degree, so if you combine the right certificates you can get a degree, perhaps a new contract is needed to implement the degree algorithm but the basics are implemented on the first contract.

Lastly, it might also be interesting to evaluate if a DAO structure would benefit the community of course creators and create a University DAO or a Decentralized University, then again this could backfire since sometimes the content from the courses might not be science-backed and it could go the wrong way. e.g. A flat earth content creator that joins the Decentralized University to promote its content, and people get certified with the course on Why the earth is flat. 

### Contract Address deployed on Rinkeby
0x9446fC442d6aB4389D5804e0639da0261404EE63

### Website and dApp
