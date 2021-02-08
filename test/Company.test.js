const Company = artifacts.require("./Company");


require('chai')
  .use(require('chai-as-promised'))
  .should()


contract('Company', ([deployer, user1, user2])=>{

  let company;

  beforeEach(async () => {
    company = await Company.new();
  })

  describe('deployment', ()=>{   

  })

  describe('registering company', async () => {
    let result;
    let name = "juhel ltd";
    let tin = '11234545js';
    let dateOfIncorporation = '1998';
    let certOfIncorporation = 'jkfdsakjfdasjlfdasj;41309mbafsdm';
    let nafdacNumber = 'CAI115534';
    let rcNumber = '1199AA43';

    beforeEach(async() => {
      // Register company
      result = await company.registerCompany(name, tin, dateOfIncorporation, certOfIncorporation, nafdacNumber, rcNumber, { from: user1});
    })

    describe('success', () => {
      

      it('checks number of registered companies', async () => {
        const companyCount = await company.companyCount();
        companyCount.toString().should.equal('1');
      }) 

      it('emit CompanyDetailsEvent event', async () => {
        const log = result.logs[0];
        log.event.should.eq('CompanyDetailsEvent');

        const event = log.args;
        event._name.toString().should.eq(name, "_name is correct");
        event._tin.toString().should.eq(tin, "_tin is correct");
        event._dateOfIncorporation.toString().should.eq(dateOfIncorporation, "_dateOfIncorporation is correct");
        event._certOfIncorporation.toString().should.eq(certOfIncorporation, "_certOfIncorporation is correct");
        event._nafdacNumber.toString().should.eq(nafdacNumber, "_nafdacNumber is correct");
        event._rcNumber.toString().should.eq(rcNumber, "_rcNumber is correct");
        
      })
        
    })

    describe('failure', async () => {

      it('rejects double registeration of a company', async() => {
        await company.registerCompany(name, tin, dateOfIncorporation, certOfIncorporation, nafdacNumber, rcNumber, { from: user1}).should.be.rejectedWith("Company with this NAFDAC number already exist");
      })
     
    })
    
    
    
  })
  

 
 
  

})