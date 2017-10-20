package icia.project.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

public class TransactionExe {

	@Autowired
	protected DataSourceTransactionManager transactionManager;
	protected TransactionStatus status;
	
	
	
	// transaction Definition
	protected void setTransactionConf(int propagationBehavior, int isolationLevel, boolean readOnly) {

		// Transaction의 Propagation과 Isolation 지정
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		// propagationBehavior : propagation의 상수값
		def.setPropagationBehavior(propagationBehavior);
		// isolationLevel : Isolation의 상수 값
		def.setIsolationLevel(isolationLevel);
		// readOnly : 읽기적용에 대한 boolean, 단순히 읽어오기 insert,delete,update 사용 불가 => select만 가능  속도향상
		def.setReadOnly(readOnly);
		
		status = transactionManager.getTransaction(def);
		
	}
	
	// transaction Result
	protected void setTransactionResult(boolean isResult) {
		
		if(isResult) {
			transactionManager.commit(status);
		}else {
			transactionManager.rollback(status);
		}
		
	}
	

}