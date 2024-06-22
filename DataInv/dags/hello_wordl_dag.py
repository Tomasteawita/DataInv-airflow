from airflow.models.dag import DAG
from airflow.operators.dummy_operator import DummyOperator
from datetime import datetime
from airflow.operators.python import PythonOperator, ShortCircuitOperator
from datetime import timedelta


def print_hello(**kwargs):
    
    inputs = [kwargs['ti'].xcom_pull(key=f'input_{i+1}') for i in range(0,3)]
    for dag_input in inputs:
        print(f'Hello {dag_input}!')

def gen_xcom(**kwargs):
    confs = kwargs.get('dag_run').conf
    input_1 = confs.get('input_1')
    input_2 = confs.get('input_2')
    input_3 = confs.get('input_3')

    inputs = [input_1, input_2, input_3]

    for i in range(0,3):
        print(f'Generated XCOM: input_{i+1}={inputs[i]}')
        kwargs['ti'].xcom_push(key=f'input_{i+1}', value=inputs[i])





input_prompts = {
    'input_1': 'What is your name?',
    'input_2': 'What is your favorite color?',
    'input_3': 'What is your favorite food?'
}

default_args = {
    "owner": "Tomasteawita",
    "dependes_on_past": False,
    "wait_for_downstream": False,
    "retries": 1,
    "retry_delay": timedelta(minutes=5),
    "provide_context": True,
    "params": input_prompts
}


with DAG(
    dag_id='HELLO_WORDL',
    default_args=default_args,
    description='A simple tutorial DAG',
    schedule_interval=None,
    tags=['TEST_CONFIGS'],  
    max_active_runs=1,
    catchup=False,
) as dag:

    start = DummyOperator(task_id='start')

    gen_xcom_task = PythonOperator(
        task_id='gen_xcom',
        python_callable=gen_xcom,
        provide_context=True
    )

    print_hello_task = PythonOperator(
        task_id='print_hello',
        python_callable=print_hello,
        provide_context=True
    )

    start >> gen_xcom_task >> print_hello_task