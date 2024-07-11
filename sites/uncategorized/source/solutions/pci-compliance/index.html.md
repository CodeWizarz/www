---
layout: markdown_page
description: "Here you can find information on how GitLab can help you with your PCI compliance. View more here!"
title: "Building PCI-Compliant Applications with GitLab"
canonical_path: "/solutions/pci-compliance/"
---
## GitLab can help you with your PCI compliance

Compliance with the [Payment Card Industry (PCI) Data Security Standard (DSS)](https://www.pcisecuritystandards.org/documents/PCI%20SSC%20Quick%20Reference%20Guide.pdf) helps to alleviate security vulnerabilities and protect cardholder data. The PCI DSS regulations are required of any enterprise handling credit card data.


Application security is a critical element for the enterprise wishing to be PCI-compliant. Application attacks compromise the logic flow and data handling from within the application, affording access to sensitive data and more. Identifying and removing vulnerabilities during development and testing is the most effective way to reduce these risks. With traditional application security solutions, the security scans find the vulnerabilities, but the details must be communicated to development, logged in an issue tracker, prioritized and followed. These are separate workflows, with separate systems, and distinct viewpoints.

With GitLab, every new code commit is automatically scanned for security vulnerabilities and also license compliance. The developer sees results immediately, within the merge request pipeline. Many can be resolved right away without ever involving security pros. For those not easily resolved, the developer can create an issue with one click. Both dev and app sec can track remaining vulnerabilities in the Security Dashboard. In addition, because security testing is embedded in the CI/CD workflow, ALL code can be tested, not just a subset that is affordable to test or most mission critical.  

Using GitLab CI/CD can help you meet PCI DSS requirements, not only by surfacing the vulnerabilities, but also by helping the developers resolve them before the code leaves their workflow. GitLab’s single application includes the following application security scanning capabilities and automatically applies them to every code commit:

* **Static Application Security Testing (SAST)** which analyzes the source code of an application for common security vulnerabilities. This automated code review helps developers identify and resolve issues right away within their development workflow.

* **Dynamic Application Security Testing (DAST)** which scans working web applications for common security vulnerabilities. It is essentially automated penetration testing. With GitLab, DAST uses the review app, created by GitLab CI/CD, to test earlier in the life cycle than stand-alone security tools can accomplish.

* **Container Scanning** which identifies known vulnerabilities in your Docker images. If you distribute your application with Docker, there's a chance that your image (reused code) is based on other Docker images that may in turn contain some known vulnerabilities that could be exploited.

* **Dependency Scanning** which identifies open source code libraries, being used by your application, with known vulnerabilities. In the same manner as container scanning, you must test all of the third party code you use.

For more information on all of the GitLab security capabilities, including License Compliance, see the [DevSecOps solution](https://about.gitlab.com/solutions/dev-sec-ops/).

Now let's look at how GitLab applies to the PCI regulatory requirements. The PCI DSS requirements include 6 goals that are broken down into 12 requirements. The following section details the PCI DSS requirements that the GitLab capabilities cover, as well as guidance for assessors who may be evaluating these tools for compliance. The descriptions have been edited for brevity. For complete requirements, see the [PCI Security Standards website](https://www.pcisecuritystandards.org/) or [PCI DSS Reference Guide](https://www.pcisecuritystandards.org/documents/PCI%20SSC%20Quick%20Reference%20Guide.pdf).

 <style type="text/css">
 .tg  {border-collapse:collapse;border-spacing:0;}
 .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
 .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
 .tg .tg-1wig{font-weight:bold;text-align:left;vertical-align:top}
 .tg .tg-fymr{font-weight:bold;border-color:inherit;text-align:left;vertical-align:top}
 .tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
 .tg .tg-0lax{text-align:left;vertical-align:top}
 </style>
 <table class="tg" style="undefined;table-layout: fixed; width: 783px">
 <colgroup>
 <col style="width: 213px">
 <col style="width: 337px">
 <col style="width: 233px">
 </colgroup>
   <tr>
     <th class="tg-fymr">PCI Requirement</th>
     <th class="tg-fymr">GitLab Solution</th>
     <th class="tg-fymr">Assessor Guidance</th>
   </tr>
   <tr>
     <td class="tg-0pky"><span style="font-weight:bold">1.3.7—Do not disclose private IP addresses and routing information to unauthorized parties.</span></td>
     <td class="tg-0pky">* DAST can highlight areas in applications that expose private IP addressing. <br>* Dependency scanning and Container scanning both look for use of third party code with known vulnerabilities, which may included this use case.</td>
     <td class="tg-0pky">Look for this finding in the DAST section of the Security Dashboard to see if it was detected and remains present.</td>
   </tr>
   <tr>
     <td class="tg-0pky"><span style="font-weight:bold">2.1—Always change vendor supplied defaults and remove or disable unnecessary default accounts.</span></td>
     <td class="tg-0pky">* DAST can be used to validate that web applications do not have default passwords and accounts available for use. This is most useful for commercial off-the-shelf applications.<br>* Dependency scanning and Container scanning both look for use of third party code with known vulnerabilities, which may included this use case.</td>
     <td class="tg-0pky">Use DAST to scan commercial off-the-shelf applications and internally developed applications to look for default accounts. Scans should be reviewed and remediated.</td>
   </tr>
   <tr>
     <td class="tg-0pky"><span style="font-weight:bold">2.2.4—Configure system security parameters to prevent misuse.</span></td>
     <td class="tg-0pky">Both SAST and DAST, along with Container and Dependency scanning can test applications to find configurations that would be deemed insecure. An example would be connections to other systems or applications that use insecure protocols.</td>
     <td class="tg-0pky">All of the GitLab security scans can be used in support of this requirement and should be deployed as part of the CI/CD process.</td>
   </tr>
   <tr>
     <td class="tg-1wig">3.6.1—Generation of strong cryptographic keys.</td>
     <td class="tg-0lax">SAST analyzes situations whereby cryptographic keys are generated by an application using APIs. Misuse can be detected and highlighted for a developer to address.</td>
     <td class="tg-0lax">In the case that crypto key generation is required, SAST will help ensure that the code generating those keys uses methods that will result in strong keys.</td>
  </tr>
  <tr>
     <td class="tg-1wig">4.1—Use strong cryptography and security protocols to safeguard sensitive data during transmission.</td>
     <td class="tg-0lax">* SAST can detect usage of insecure cryptographic algorithms and protocols in the source code. <br>* DAST scans applications to help ensure they are using secure protocols for their communications. <br>These tests can be especially useful for applications that rely on software controls to enforce secure protocols and encryption.<br>* Dependency scanning and Container scanning both look for use of third party code with known vulnerabilities, which may included this use case.</td>
     <td class="tg-0lax">Use SAST or DAST in conjunction with encryption tools to ensure applications are not relying on insecure protocols or algorithms. Note that the absence of strong cryptography at the source-code or application layer does not conclude the absence of it for the system. Mitigation may be applied for the entire system through a hardware-based control, which encrypts / decrypts all data leaving/entering the system.</td>
  </tr>
  <tr>
     <td class="tg-1wig">6.1—Establish a process to identify security vulnerabilities.</td>
     <td class="tg-0lax">Using GitLab for CI/CD will automatically run security scans for every code commit. No other vendor can, with a single application, run SAST and DAST this early in the lifecycle and also scan container images and dependencies all within a merge request pipeline. Each scan has its own use case and applicability to this requirement.</td>
     <td class="tg-0lax">Processes should be put in place to ensure application security tools are applied consistently. Using GitLab for CI/CD makes it easy to prove that security scans are being applied to every application and every code commit.</td>
   </tr>
   <tr>
     <td class="tg-1wig">6.2—Ensure that all system components and software are protected from known vulnerabilities.</td>
     <td class="tg-0lax">DAST will identify known vulnerabilities in protocols or implementations that may exist outside the code of the custom application. For example, an application that leverages an insecure method of communication would be flagged for follow-up.<br> Dependency scanning will identify third party code with known vulnerabilities.<br>Container scanning will identify vulnerable Docker images.</td>
     <td class="tg-0lax">As open source code grows exponentially and containers simplify cloud transformation, it becomes increasingly important to scan your third party code.</td>
   </tr>
    <tr>
      <td class="tg-1wig">6.3—Develop internal and external software applications securely.</td>
      <td class="tg-0lax">* GitLab security capabilities help you develop secure applications.<br>* The GitLab application itself also enables secure code development via features such as two-factor authentication, merge request approvals and more. See <a href="https://about.gitlab.com/security/">how we secure GitLab</a> and how GitLab can help you secure your development environment.</td>
      <td class="tg-0lax">With the new GDPR regulations, this requirement becomes even stronger. You must produce a secure app and also be accountable for that of the vendors you engage.</td>
    </tr>
    <tr>
      <td class="tg-1wig">6.3.1—Remove development, text and/or custom application accounts, user IDs, and passwords before applications become active.</td>
      <td class="tg-0lax">SAST and DAST will scan for poor authentication methods, such as hardcoded or weak passwords, which could end up in a production application.</td>
      <td class="tg-0lax">SAST should be used with other processes and methods, such as manual reviews of database entries, to help ensure that test or development credentials are do not end up in deployed code.</td>
    </tr>
    <tr>
      <td class="tg-0pky"><span style="font-weight:bold">6.3.2—Review custom code prior to release.</span></td>
      <td class="tg-0pky">* SAST should be included in the go-live process for any custom code to help ensure that vulnerabilities are caught early. This process should augment existing code-review processes to bring scale to larger deployments.<br>* DAST checks that web application code, when introduced into its deployed environment, does not have additional runtime issues only introduced there.</td>
      <td class="tg-0pky">SAST and DAST can be used to support this requirement as part of a larger program for custom code review. In addition, any business logic code that is intended to implement security-like functionality should be reviewed manually by domain experts.</td>
    </tr>
    <tr>
      <td class="tg-0pky"><span style="font-weight:bold">6.5—Address common coding vulnerabilities in software development processes.</span></td>
      <td class="tg-0pky">* SAST and DAST scans identify common application vulnerabilities in the code and the working review app.<br>* Dependency scanning and Container scanning both look for use of third party code with known vulnerabilities, which typically include the OWASP Top 10. <br>* Specific tests vary by the scanning tool used, which is dependent upon the application's coding language. See <a href="https://docs.gitlab.com/ee/user/application_security/sast/">GitLab documentation</a> for specifics.</td>
      <td class="tg-0pky">* Vulnerabilities found by GitLab security testing should be reviewed and remediated by the developer whenever possible. Unresolved items can be reviewed on the Security Dashboard and turned into issues. Removing vulnerabilities early is far more efficient than later in the lifecycle. <br>* Vulnerabilities can be resolved directly in the application or externally through additional controls like a Intrusion Detection and Prevention.</td>
    </tr>
    <tr>
      <td class="tg-0pky"><span style="font-weight:bold">6.5.1-Injection flaws.</span></td>
      <td class="tg-0pky">SAST and DAST scan the code and the review app, respectively, to find potential injection flaws, and then provide the developer with guidance on how to address the vulnerability.</td>
      <td class="tg-0pky">Injection flaws allow a hacker to inject a malicious query or other code, which can alter the logic flow and/or data query in the application. This can result in data loss or other unintended outcomes. These vulnerabilities should be removed early in the life cycle.</td>
    </tr>
    <tr>
      <td class="tg-0pky"><span style="font-weight:bold">6.5.2—Buffer overflows.</span></td>
      <td class="tg-0pky">SAST and DAST scan the code and the review app, respectively, to find potential buffer overflow situations, and then provide the developer with guidance on how to address the vulnerability.</td>
      <td class="tg-0pky">Buffer overflow occurs when a program, while writing data to a buffer, reads or writes past the buffer’s boundary, writing over adjacent memory. This causes errors to occur that usually end execution of the application in an unexpected way. Security scans help you identify potential buffer overflow errors so they may be corrected.</td>
    </tr>
    <tr>
      <td class="tg-0pky"><span style="font-weight:bold">6.5.3—Insecure cryptographic storage.</span></td>
      <td class="tg-0pky">DAST finds situations where sensitive information is stored in locations without strong cryptography.</td>
      <td class="tg-0pky">Note that cryptographic storage external to the application will not be discovered. Manual review of those controls will be required.</td>
    </tr>
    <tr>
      <td class="tg-0pky"><span style="font-weight:bold">6.5.4—Insecure communications.</span></td>
      <td class="tg-0pky">SAST and DAST scan the code and the review app, respectively, to find potentially insecure communications, and then provide the developer with guidance on how to address the vulnerability. </td>
      <td class="tg-0pky">Insecure communication can happen in multiple areas of the application. DAST and SAST can highlight obvious areas. However, security teams should also perform a manual review to ensure the data they consider sensitive is communicated securely.</td>
    </tr>
    <tr>
      <td class="tg-0pky"><span style="font-weight:bold">6.5.5—Improper error handling.</span></td>
      <td class="tg-0pky">SAST and DAST scan the code and the review app, respectively, to find improper error handling, and then provide the developer with guidance on how to address the vulnerability. </td>
      <td class="tg-0pky">Error handling problems can lead to the disclosure of underlying code, stability issues, and remote exploits. Proper error handling helps ensure that when things go wrong in an application, they go wrong safely and don’t give an attacker information about your application, or a method for exploit. </td>
    </tr>
    <tr>
      <td class="tg-0pky"><span style="font-weight:bold">6.5.6—All “high risk” vulnerabilities identified in the vulnerability identification process.</span></td>
      <td class="tg-0pky">* With GitLab, SAST and DAST reports in the merge request show high-risk vulnerabilities, and then provide the developer with guidance on how to address them.<br>* The Security Dashboard also indicates vulnerabilities with the greatest risk.</td>
      <td class="tg-0pky">Be sure that high-risk vulnerabilities are remediated or that issues are created for subsequent remediation efforts.</td>
    </tr>
    <tr>
      <td class="tg-0pky"><span style="font-weight:bold">6.5.7—Cross-site scripting (XSS).</span></td>
      <td class="tg-0pky">SAST and DAST scan the code and the review app, respectively, to find potential cross-site-scripting flaws, and then provide the developer with guidance on how to address the vulnerability.</td>
      <td class="tg-0pky">XSS enables attackers to inject script into web pages causing them to behave in a potentially malicious way. These vulnerabilities should be removed early during CI/CD via automated security scans.</td>
    </tr>
    <tr>
      <td class="tg-0pky"><span style="font-weight:bold">6.5.8—Improper access control.</span></td>
      <td class="tg-0pky">SAST and DAST scan the code and the review app, respectively, to find improper access control, and then provide the developer with guidance on how to address the vulnerability. </td>
      <td class="tg-0pky">Access control issues include things such as directory traversal, restricted URL access, and private IP leakage. Improper access control should be identified and removed early via SAST and DAST scans.</td>
    </tr>
    <tr>
      <td class="tg-0pky"><span style="font-weight:bold">6.5.9—Cross-site request forgery (CSRF).</span></td>
      <td class="tg-0pky">SAST and DAST scan the code and the review app, respectively, to find potential cross-site request forgery, and then provide the developer with guidance on how to address the vulnerability. </td>
      <td class="tg-0pky">In CSRF, malicious commands are transmitted from a user that the website trusts. Like XSS, it causes the web application to behave in an unexpected way. CSRF should be identified and removed early in the CI/CD process via SAST and DAST scans.</td>
    </tr>
    <tr>
      <td class="tg-0pky"><span style="font-weight:bold">6.5.10—Broken authentication and session management.</span></td>
      <td class="tg-0pky">SAST and DAST scan the code and the review app, respectively, to find broken authentication and session management flaws, and then provide the developer with guidance on how to address the vulnerability. </td>
      <td class="tg-0pky">These flaws should be identified and removed in the CI/CD process via SAST and DAST scans.</td>
    </tr>
    <tr>
      <td class="tg-0pky"><span style="font-weight:bold">6.6—For public-facing web applications, address new threats and vulnerabilities on an ongoing basis and ensure these applications are protected against known attacks.</span></td>
      <td class="tg-0pky">DAST can be used to scan applications for this requirement. GitLab makes it easy to comply since the scan is automatically performed for every code commit.  </td>
      <td class="tg-0pky">Ensure all identified vulnerabilities are resolved or an issue created for subsequent sprints.</td>
    </tr>
    <tr>
      <td class="tg-0pky"><span style="font-weight:bold">7.2—Establish an access control system(s) for systems components that restricts access based on a user’s need to know, and is set to “deny all” unless specifically allowed.</span></td>
      <td class="tg-0pky">SAST identifies code that may override, weaken, or be vulnerable in ways that reduces the assumed level of access control in an application. </td>
      <td class="tg-0pky">SAST should be used to help detect software vulnerabilities that could lead to weakened access control.</td>
    </tr>
    <tr>
      <td class="tg-0pky"><span style="font-weight:bold">8.1.8—If a session has been idle for more than 15 minutes, require the user to re-authenticate to re-activate the terminal or session.</span></td>
      <td class="tg-0pky">SAST and DAST can test session timeouts in applications to determine if this requirement is met. </td>
      <td class="tg-0pky">Application settings add an extra layer of security to your environment by ensuring that the application times out even if the terminal does not.</td>
    </tr>
    <tr>
      <td class="tg-0pky"><span style="font-weight:bold">8.2.1—Using strong cryptography, render all authentication credentials (such as passwords/ phrases) unreadable during transmission and storage on all system components.</span></td>
      <td class="tg-0pky">SAST and DAST can detect the misuse of cryptographic APIs that detect poor key management and stored passwords. They can identify storing sensitive information in clear text and storing sensitive information in storage locations that do not have strong crypto. </td>
      <td class="tg-0pky">Weak cryptographic usage can spring from misconfiguration or outdated code. SAST validates that the application uses cryptographic code properly.</td>
    </tr>
    <tr>
      <td class="tg-0pky"><span style="font-weight:bold">10.2.4—Invalid logical access attempts.</span></td>
      <td class="tg-0pky">SAST can advise developers when invalid access attempts do not result in a logged entry. For apps that are handling logical access control internally, this check can help ensure that the app is performing according to requirements by looking for log entries on invalid logical access attempts. </td>
      <td class="tg-0pky">Malicious users often will try multiple ways to gain access to information or functionality they are not permitted to access. Early warning detection systems require valid log entries to detect bad behavior and alert on it. Assessors can use this evidence to verify this requirement is met.</td>
    </tr>
    <tr>
      <td class="tg-0pky"><span style="font-weight:bold">10.3.4—Success or failure indication.</span></td>
      <td class="tg-0pky">SAST can help ensure that success and/or failure are properly logged as part of the normal event log. Oftentimes, developers log failed attempts but miss successful ones. </td>
      <td class="tg-0pky">Log entries by themselves must indicate success or failure to assist in early detection and for compliance validation. Assessors can use this evidence to verify this requirement is met. </td>
    </tr>
    <tr>
      <td class="tg-0pky"><span style="font-weight:bold">10.5.2—Protect audit trail files from unauthorized modifications .</span></td>
      <td class="tg-0pky">SAST can detect software issues that may allow log-forging attacks to be successful, which may allow unauthorized modification to occur. </td>
      <td class="tg-0pky">Log integrity is critical if you need to use those logs to find a breach or an insider. An attack that modifies the audit trail can cover the tracks of an attacker.</td>
    </tr>
    <tr>
      <td class="tg-0pky"><span style="font-weight:bold">11.3.1—Perform external penetration testing at least annually and after any significant infrastructure or application upgrade or modification.</span></td>
      <td class="tg-0pky">When using GitLab, every code commit is automatically tested both statically and dynamically and dependencies and containers are checked for vulnerabilities.</td>
      <td class="tg-0pky">It is possible that GitLab security capabilities could be a valid compensating control though challenges are unknown. External penetration testing may still be required.</td>
    </tr>
    <tr>
      <td class="tg-0pky"><span style="font-weight:bold">11.3.2—Perform internal penetration testing at least annually and after any significant infrastructure or application upgrade or modification.</span></td>
      <td class="tg-0pky">When using GitLab, every code commit is automatically tested both statically and dynamically and dependencies and containers are checked for vulnerabilities. </td>
      <td class="tg-0pky">Internal penetration testing groups may wish to review security reports and assess any challenges in the workflow processes. </td>
    </tr>
    <tr>
      <td class="tg-0pky"><span style="font-weight:bold">12.2—Implement a risk-assessment process.</span></td>
      <td class="tg-0pky">While GitLab security capabilities are not risk-assessment tools per se, they can all be used in support of a risk-assessment methodology. The GitLab Security Dashboard shows risk levels of specific vulnerabilities. </td>
      <td class="tg-0pky">Outputs of these security scans should be incorporated into the risk-assessment process used to meet this requirement.</td>
    </tr>
</table>

THE INFORMATION PROVIDED ON THIS WEBSITE IS TO BE USED FOR INFORMATIONAL PURPOSES ONLY. THE INFORMATION SHOULD NOT BE RELIED UPON OR CONSTRUED AS LEGAL OR COMPLIANCE ADVICE OR OPINIONS. THE INFORMATION IS NOT COMPREHENSIVE AND WILL NOT GUARANTEE COMPLIANCE WITH ANY REGULATION OR INDUSTRY STANDARD. YOU MUST NOT RELY ON THE INFORMATION FOUND ON THIS WEBSITE AS AN ALTERNATIVE TO SEEKING PROFESSIONAL ADVICE FROM YOUR ATTORNEY AND/OR COMPLIANCE PROFESSIONAL.
