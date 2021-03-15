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
    let country = 'nigeria';
    let applicant = 'applicant';
    let customerCare = '08012345678';
    let homeAddress = 'No 1 enugu road nigeria';
    let tin = '11234545js';
    let dateOfIncorporation = '1998';
    let certOfIncorporation = 'jkfdsakjfdasjlfdasj;41309mbafsdm';
    let license = 'jkfdsakjfdasjl4455';
    let nafdacNumber = 'CAI115534';
    let rcNumber = '1199AA43';


    beforeEach(async() => {
      // Register company
      result = await company.registerCompany(name, nafdacNumber, applicant,  { from: user1});
      result2 = await company.uploadCertificates(tin, rcNumber, dateOfIncorporation, license,  { from: user1});
    })

    describe('success', () => {
      

      it('checks number of registered companies', async () => {
        const companyCount = await company.companyCount();
        console.log(companyCount);
        companyCount.toString().should.equal('1');
      }) 

      it('emit RegisteredCompanyEvent event', async () => {
        const log = result.logs[0];
        log.event.should.eq('RegisteredCompanyEvent');

        const event = log.args;
        event._id.toString().should.eq('1', "_id is correct");
        event._name.toString().should.eq(name, "_name is correct");
        event._nafdacNumber.toString().should.eq(nafdacNumber, "_nafdacNumber is correct");
        event._applicant.toString().should.eq(applicant, "_applicant is correct");
       
      })
      it('emit uploadCertificates event', async () => {
        const log = result2.logs[0];
        log.event.should.eq('CompletedCompanyEvent');

        const event = log.args;
        event._id.toString().should.eq('1', "_id is correct");
  
       
      })
        
    })

    describe('failure', async () => {

      it('rejects double registeration of a company', async() => {
        await company.registerCompany(name, nafdacNumber, applicant, { from: user1}).should.be.rejectedWith("Company with this ADDRESS already exist");
      })
     
    })
    
    
    
  })
  

 
 
  

})