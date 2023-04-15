using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraFollow : MonoBehaviour
{
    [SerializeField] private Transform target;
    [SerializeField] private Vector2 offset; // affect z-axis and y-axis
    public float chaseSpeed = 5;

    void LateUpdate()
    {
        Vector3 targetPosition = new Vector3(transform.position.x, target.position.y + offset.y, target.position.z + offset.x);
        transform.position = Vector3.Lerp(transform.position, targetPosition, chaseSpeed * Time.deltaTime);
    }
}
